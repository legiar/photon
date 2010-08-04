class AlbumsController < ApplicationController
  layout :set_layout
  before_filter :require_user, :except => [:index, :show]
  before_filter :require_admin, :except => [:index, :show]
  
  def index
    # TODO => Pagination !!!
    @albums = Album.all
  end
  
  def show
    @album = Album.find(params[:id])
    @pictures = @album.pictures.processed
  end
  
  def new
    @album = Album.new
    5.times { @album.pictures.build }
  end
  
  def create
    params[:album][:user] = current_user
    @album = Album.new(params[:album])
    if @album.save
      flash[:notice] = t(:albums_create_ok)
      redirect_to @album
    else
      render :action => 'new'
    end
  end
  
  def edit
    @album = Album.find(params[:id])
    5.times { @album.pictures.build }
  end
  
  def update
    params[:album][:user] = current_user
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      flash[:notice] = t(:albums_update_ok)
      redirect_to @album
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = Album.find(params[:id])
    @user.destroy
    flash[:notice] = t(:albums_delete_ok)
    redirect_to root_path
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
