class LikesController < ApplicationController

    def toggleLikeP #like and unlike Photo
        @photo = Photo.find(params[:id])
        if @photo.likes.pluck(:user_id).include?(current_user.id)     
            Like.destroy_by(user_id: current_user.id, likeable_id: params[:id], likeable_type:"Photo")   
        else
            Like.create(user_id: current_user.id, likeable_id: params[:id], likeable_type:"Photo") 
        end
    end

    def toggleLikeA #like and unlike album
        @album = Album.find(params[:id])
        if @album.likes.pluck(:user_id).include?(current_user.id)     
            Like.destroy_by(user_id: current_user.id, likeable_id: params[:id], likeable_type:"Album")   
        else
            Like.create(user_id: current_user.id, likeable_id: params[:id], likeable_type:"Album") 
        end
    end
    
end