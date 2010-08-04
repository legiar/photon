class Picture < ActiveRecord::Base
  belongs_to :user
  belongs_to :album
  has_one :exif

  mount_uploader :photo, PhotoUploader

  after_create :process_metadatas_exif
  after_create :create_other_sizes
  scope :processed, lambda { { :conditions => ['photo_processing = ?', false] } }
  scope :processing, lambda { { :conditions => ['photo_processing = ?', true] } }

  def process_metadatas_exif
    puts "WIP"
  end
  
  def create_other_sizes
    # Will create:
    # large  => 1024x
    # medium => 500x
    # normal => 640x
    # small  => 240x
    # thumb  => 100x
  end
  
end
