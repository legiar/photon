class Picture < ActiveRecord::Base
  belongs_to :user
  belongs_to :album
  
  has_attached_file :picture,
    :styles => { 
      :large => "1024x768",
      :medium => "500x322",
      :normal => "640x670",
      :small => "240x159",
      :thumb => "100x66"
    },
    :default_style => :normal
    
    process_in_background :picture
    
    validates_attachment_content_type :picture, :content_type => [
      "image/jpeg", "image/png", "image/gif"
    ]
    validates_attachment_presence :picture

end
