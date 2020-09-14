class AlbumsController < ApplicationController
    
    before_action :photo_params, only: [:create]
    before_action :show_user_album, only: [:index]
    # before_action :userId_params, only: [:index,:create, :update]
    # before_action :albumId_params, only: [:edit, :update, :destroy]
    # before_action :photoId_params, only: [:destroy]
    
    def index
        @user = User.find(params[:user_id])
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
            flash.keep[:error] = "You must fill in the title and upload image less than 2Mb"
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

        def show_user_album
            @albums = current_user.albums.all.order(created_at: :asc).page(params[:page]).per(8)
        end

        # def userId_params
        #     params.require(:user_id)
        # end

        # def albumId_params
        #     params.require(:id)
        # end

        
        # def photoId_params
        #     params.require(:photo_id)
        # end
        
        
     
end