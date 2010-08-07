class ProcessDeleteOtherSizesJob < Struct.new(:picture_path)
  
  def perform
    fname = File.basename(picture_path)
    dir = File.dirname(File.dirname(picture_path))
    
    ['large', 'original', 'normal', 'medium', 'small', 'thumb'].each do |fsize|
      file = File.join(dir, fsize, fname)
      if File.exist? file
        File.delete file
      end
    end
  end
end