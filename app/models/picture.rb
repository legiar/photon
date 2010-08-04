class Picture < ActiveRecord::Base
  belongs_to :user
  belongs_to :album
  has_one :metadata
  has_one :exif

    #:styles => { 
    #  :large => "1024x",
    #  :medium => "500x",
    #  :normal => "640x",
    #  :small => "240x",
    #  :thumb => "100x"    

    after_create :process_metadatas_exif
    scope :processed, lambda { { :conditions => ['photo_processing = ?', false] } }
    scope :processing, lambda { { :conditions => ['photo_processing = ?', true] } }

    def process_metadatas_exif
      puts "WIP"
    end

end
