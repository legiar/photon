class Picture < ActiveRecord::Base
  belongs_to :user
  belongs_to :album
  has_one :metadata
  has_one :exif

  has_attached_file :picture,
    :styles => { 
      :large => "1024x",
      :medium => "500x",
      :normal => "640x",
      :small => "240x",
      :thumb => "100x"
    },
    :default_style => :normal
    
    process_in_background :picture
    
    validates_attachment_content_type :picture, :content_type => [
      "image/jpeg", "image/png", "image/gif"
    ]
    validates_attachment_presence :picture

    after_create :update_exif_datas
    scope :processed, lambda { { :conditions => ['picture_processing = ?', false] } }

    def update_exif_datas
      puts "WIP"
    end

end
