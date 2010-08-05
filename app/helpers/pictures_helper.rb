module PicturesHelper
  def get_picture_url(photo, p_size = :original)
    store_dir = File.dirname(photo.store_dir)
    if [:large, :medium, :normal, :small, :thumb, :original].include? p_size
      return File.join("/", store_dir, p_size.to_s, File.basename(photo.path))
    else
      return File.join("/", store_dir, "default", "invalid.png")
    end
  end
  
  def navigation_objects(album, photo)
    # Return three objects
    index_in_album = album.pictures.index(photo)
    album_size = album.pictures.size
    pictures = album.pictures
    
    case index_in_album
      when 0
        # first
        # Return actual act+1 act+2
        return [photo, pictures[1], pictures[2]]
      when album_size
        # last
        # return act act-1 act-2
        return [pictures[album_size-2], pictures[album_size-1], photo]
      else
        # not first and not last :D
        # return act-1 act act+1
        return [pictures[index_in_album-1], photo, pictures[index_in_album+1]]
    end
  end
    
end
