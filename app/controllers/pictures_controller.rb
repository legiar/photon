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
  
  def new
    @album = Album.find(params[:album_id])
    @picture = Picture.new
  end
  
  def create
    @album = Album.find(params[:album_id])
    params[:picture][:album] = @album
    params[:picture][:user] = current_user
    @picture = Picture.new(params[:picture])
    
    if @picture.save
      redirect_to @album
    else
      render :action => :new
    end
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
