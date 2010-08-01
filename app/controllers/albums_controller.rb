class AlbumsController < ApplicationController
  layout :set_layout
  filter_resource_access
  
  def index
  end
  
  def new
    @album = Album.new
  end
  
  
  private
  def set_layout
    l = "application"
    if action_name == "index"
      l = "albums_layout"
    end
    if action_name == "show"
      l = "album_layout"
    end
    return l
  end
end
