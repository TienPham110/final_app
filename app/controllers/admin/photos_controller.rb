module Admin 
    class PhotosController < ApplicationController
        before_action :check_admin, only: [:show]
        before_action :photo_params, only: [:update]

        PER_PAGE = 40

        def show #
            @photos = Photo.all.order(updated_at: :desc).page(params[:page]).per(PER_PAGE)
        end

        def edit #
            @photo = Photo.find(params[:photo_id])
        end
        
        def update
            @photo = Photo.find(params[:photo_id])
            if @photo.update(photo_params)
                flash.keep[:success] = "Update success"
                redirect_to admin_photo_path
            else
                flash.keep[:error] = "You must enter title"
                redirect_to edit_admin_photo_path 
            end
        end

        def destroy
            if @photo = Photo.find(params[:photo_id]).destroy
                flash.keep[:success] = "Delete success"
                redirect_to admin_photo_path
            else
                flash.keep[:error] = "Delete failed"
                render :destroy
            end
        end
        
            
        private
        def check_admin
            unless current_user.admin?
                redirect_to user_path(current_user.id)
            end
        end

        def photo_params
            params.require(:photo).permit(:title, :description, :image, :shared)
        end
         
    end
end