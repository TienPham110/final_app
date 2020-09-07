class PhotosController < ApplicationController
    def index
            
    end
    def new
        @photo = Photo.new
    end
    
    def create
        @photo = Photo.new(photo_params)
        @photo.user_id = userId_params
        if @photo.save
        else
            render :new
        end

    end
    private 
        def photo_params
            params.require(:photo).permit(:title, :description, :image)
        end
        def userId_params
            params.require(:user_id)
        end
        
end
