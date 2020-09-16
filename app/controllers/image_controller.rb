class ImageController < ApplicationController
    
    def destroy
        @photo = Photo.find(params[:photo_id])
        if @photo.destroy
            flash[:success] = "Delete successful"
            redirect_to edit_user_album_path(user_id: current_user.id, album_id: params[:album_id])       
        else
            flash[:error] = "Delete failed"
            render :edit
        end
    end
    
    def destroyAdmin
        @photo = Photo.find(params[:photo_id])
        if @photo.destroy
            flash[:success] = "Delete successful"
            redirect_to edit_admin_album_path(album_id: params[:album_id], id: params[:id])       
        else
            flash[:error] = "Delete failed"
            render :edit
        end
    end

    
end