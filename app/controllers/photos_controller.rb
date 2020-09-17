class PhotosController < ApplicationController
    before_action :photo_params, only: [:create, :update]
    
    PER_PAGE = 20
    def index
        @user = User.find(params[:user_id])
        if current_user.id == (params[:user_id]).to_i
            @photos = @user.photos.where(album_id:nil).order(created_at: :asc).page(params[:page]).per(PER_PAGE)
        else
            @photos = @user.photos.where(album_id:nil, shared: true).order(created_at: :asc).page(params[:page]).per(PER_PAGE)
            
        end
    end

    def new
        @photo = Photo.new
    end
    
    def create
        @photo = Photo.new(photo_params)
        @photo.user_id = params[:user_id]
        if @photo.save
            flash.keep[:success] = "Create success"
            redirect_to user_photos_path
        else
            flash.keep[:error] = "You must fill in the title and upload image less than 5Mb"
            redirect_to new_user_photo_path
        end
    end

    def edit 
        @photo = current_user.photos.find(params[:id])
    end

    def update
        @photo = current_user.photos.find(params[:id])
        if @photo.update(photo_params)
            flash.keep[:success] = "Update success"
            redirect_to user_photos_path
        else
            flash.keep[:error] = "You must enter title"
            redirect_to edit_user_photo_path 
        end
    end

    def destroy
        if @photo = Photo.find(params[:id]).destroy
            flash.keep[:success] = "Delete success"
            redirect_to user_photos_path
        else
            flash.keep[:error] = "Delete failed"
            render :destroy
        end
    end

    private 
        def photo_params
            params.require(:photo).permit(:title, :description, :image, :shared)
        end

end
