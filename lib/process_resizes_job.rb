class ProcessResizesJob < Struct.new(:picture_id)
  
  def perform
    # The process can *probably* be improved.
    picture = Picture.find(picture_id)
    file = picture.photo.path
    if File.exist? file
      picture.photo_processing = true
      picture.save
      
      dir = File.dirname(File.dirname(file))
      fname = File.basename(file)
      
      [["large", 1024],
       ["normal", 650],
       ["medium", 500],
       ["small", 240],
       ["thumb", 100]].each do |size|
        s_txt = size[0]
        s_num = size[1]
        
        fdir = File.join(dir, s_txt)
        ffile = File.join(fdir, fname)
        begin
          Dir.new(fdir)
        rescue
          Dir.mkdir(fdir)
        end
        i = QuickMagick::Image.read(file).first
        i.resize "#{s_num}x"
        i.save ffile
      end
      
      picture.photo_processing = false
      picture.save
    else
      picture.destroy if picture
    end
  end
end