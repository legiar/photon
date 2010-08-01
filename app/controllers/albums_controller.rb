class AlbumsController < ApplicationController
  layout :set_layout
  
  def index
  end
  
  private
  def set_layout
    if action_name == "index"
      return "albums_layout"
    end
    if action_name == "show"
      return "album_layout"
    end
  end
end
