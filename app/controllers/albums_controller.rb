
  class AlbumsController < ApplicationController
   before_action :find_album, only: [:show, :edit, :update, :destroy]

  def index
    # @albums = Album.all
    
    @albums = current_user.albums.paginate(page: params[:page], per_page: 4)
  end
  
  def show
  end

  def new
    @album = Album.new
  end

  def create
    ash = album_params;
    ash[:user_id] = current_user.id;
    @album =  Album.new(ash);

    if @album.save
      redirect_to albums_path, notice: "Contact #{@album.name} has been uploaded!"
    else
      render "new"
    end
  end

  def edit
  end 

  def update
     if @album.update(album_params)
      redirect_to albums_path, notice: "Contact #{@album.name} has been successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy    
    @album.destroy
    redirect_to albums_path, notice: "Contact #{@album.name} has been successfully deleted!"
  end

private
 def find_album
    @album = current_user.albums.find(params[:id])
  end
  
  def album_params
    params.require(:album).permit(:name, :phone, :email, :address, :avatar)
  end
end
