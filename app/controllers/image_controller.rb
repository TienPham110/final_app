class ImageController < ApplicationController
    
    def destroy
        @photo = Photo.find(photoId_params)
        if @photo.destroy
            flash[:success] = "Delete successful"
            redirect_to edit_user_album_path(user_id: current_user.id, album_id: albumId_params)       
        else
            flash[:error] = "Delete failed"
            render :edit
        end
    end

    private 
        def photoId_params
            params.require(:photo_id)
        end
        def albumId_params
            params.require(:id)
        end
end