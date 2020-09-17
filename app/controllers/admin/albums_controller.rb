module Admin 
    class AlbumsController < ApplicationController
        before_action :check_admin, only: [:show]
        before_action :photo_params, only: [:create, :update]
        
        PER_PAGE = 40

        def show #
            @albums = Album.all.order(updated_at: :desc).page(params[:page]).per(PER_PAGE)
        end

        def edit #
            @album = Album.find(params[:album_id])
            @photo = Photo.new
        end
        
        def update #
            @photo = Photo.new(photo_params)
            @photo.user_id = params[:user_id]
            @album = Album.find(params[:album_id])
            if !@album.update(title: @photo.title, description: @photo.description, shared: @photo.shared) &&  !@photo.save
                flash.keep[:error] = "You must fill in the title and upload image less than 2Mb"
                redirect_to edit_admin_album_path(album_id: params[:album_id])
            else
                flash.keep[:success] = "update successful"
                @album.photos << @photo
                redirect_to edit_admin_album_path(album_id: params[:album_id])
            end
        end

        def destroy
            if @album = Album.find(params[:album_id]).destroy
                flash.keep[:success] = "Delete success"
                redirect_to admin_album_path
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
            params.require(:photo).permit(:title, :description, :shared, :image)
        end
         
    end
end