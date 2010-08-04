class PicturesController < ApplicationController
  layout :set_layout
  before_filter :require_user, :except => [:index, :show]
  before_filter :require_admin, :except => [:index, :show]
  
  def index
    @album = Album.find(params[:album_id])
    @pictures = @album.pictures.processed
  end
  
  def show
    @album = Album.find(params[:album_id])
    @picture = Picture.find(params[:id])
  end
  
  private
  def set_layout
    l = "application"
    if action_name == "index"
      l = "album_layout"
    end
    if action_name == "show"
      l = "picture_layout"
    end
    return l
  end
end
