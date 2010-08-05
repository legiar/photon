module PicturesHelper
  def get_picture_url(photo, p_size = :original)
    store_dir = File.dirname(photo.store_dir)
    if [:large, :medium, :normal, :small, :thumb, :original].include? p_size
      return File.join("/", store_dir, p_size.to_s, File.basename(photo.path))
    else
      return File.join("/", store_dir, "default", "invalid.png")
    end
  end
end
