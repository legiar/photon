class Picture < ActiveRecord::Base
  belongs_to :user
  belongs_to :album
  has_one :exif

  mount_uploader :photo, PhotoUploader

  after_create :process_exif
  after_create :create_other_sizes
  scope :processed, lambda { { :conditions => ['photo_processing = ?', false] } }
  scope :processing, lambda { { :conditions => ['photo_processing = ?', true] } }

  def process_exif
    file = self.photo.path
    if File.exist? file
      begin
        exif = EXIFR::JPEG.new file
      end
      if exif
        pic_exif = self.build_exif
        pic_exif.width  = exif.width
        pic_exif.height = exif.height
        pic_exif.camera_brand = exif.make
        pic_exif.camera_model = exif.model
        pic_exif.exposure_time = exif.exposure_time.to_s
        pic_exif.f_number = exif.f_number.to_f
        pic_exif.iso_speed_rating = exif.iso_speed_ratings
        pic_exif.focale_length = exif.focal_length.to_f
        pic_exif.shot_date_time = exif.date_time
        pic_exif.flash = exif.flash
        begin
          lat = exif.gps_latitude
          lon = exif.gps_longitude
          pic_exif.gps_latitude = calc_gps(lat) if lat
          pic_exif.gps_longitude = calc_gps(lon) if lon
        end
        pic_exif.save
      end

    else
      # WTF, srsly, delete broken record. sorry.
      self.destroy
    end
  end
  
  def create_other_sizes
    # Run this -can be long- task in background
    Delayed::Job.enqueue ProcessResizesJob.new(self.id), 0, Time.at(Time.now)
  end
  
  private
  def calc_gps(lalon)
    deg = lalon[0]
    min = lalon[1]
    sec = lalon[2]
    dec_min = (min.to_f + sec.to_f/60)
    decimals = (deg.to_f + dec_min.to_f/60)
    return decimals
  end
  
end
