class AlbumsController < ApplicationController
    before_action :photo_params, only: [:create, :update]

    PER_SIZE = 20

    def index
        @user = User.find(params[:user_id])
        if current_user.id == (params[:user_id]).to_i
            @albums = @user.albums.order(created_at: :desc).page(params[:page]).per(PER_SIZE)
        else
            @albums = @user.albums.where(shared:true).order(created_at: :desc).page(params[:page]).per(PER_SIZE)
        end
    end

    def new
        @album = Album.new
        @photo = Photo.new
    end

    def create
        @photo = Photo.new(photo_params)
        @photo.user_id = params[:user_id]
        if @photo.save
            @album= Album.create(title: @photo.title, description: @photo.description, user_id: params[:user_id], shared: @photo.shared)
            @album.photos << @photo
            redirect_to user_albums_path
        else
            flash.keep[:error] = "You must fill in the title and upload image less than 5Mb"
            redirect_to new_user_album_path
        end
    end

    def edit #
        @album = current_user.albums.find(params[:id])
        @photo = Photo.new
    end

    def update #
        @photo = Photo.new(photo_params)
        @photo.user_id = params[:user_id]
        @album = current_user.albums.find(params[:id])
        if !@album.update(title: @photo.title, description: @photo.description, shared: @photo.shared) &&  !@photo.save
            flash.keep[:error] = "You must fill in the title and upload image less than 2Mb"
            redirect_to edit_user_album_path
        else
            flash.keep[:success] = "update successful"
            @album.photos << @photo
            redirect_to edit_user_album_path
        end
    end

    def destroy
        if @album = Album.find(params[:id]).destroy
            flash.keep[:success] = "Delete successful"
            redirect_to user_albums_path
        else
            flash.keep[:error] = "Delete failed"
            render :edit
        end
        @photo = Photo.find(params[:photo_id])
        if @photo.destroy
            flash.keep[:success] = "Delete successful"
            redirect_to edit_user_album_path
        else 
            flash.keep[:error] = "Delete failed"
            redirect_to edit_user_album_path
        end
    end

    

    private 
        def photo_params 
            params.require(:photo).permit(:title, :description, :shared, :image)
        end

        
     
end