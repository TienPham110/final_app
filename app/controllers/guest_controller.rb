class GuestController < ApplicationController
    skip_before_action :authenticate_user!
    
    PER_PAGE = 6

    def albums
        @albums = Album.where(shared:true).order(updated_at: :desc).page(params[:page]).per(PER_PAGE)
        render template: "guest/albums"
    end

    def photos
        @photos = Photo.where(shared:true, album_id:nil).order(updated_at: :desc).page(params[:page]).per(PER_PAGE)
        render template: "guest/photos" 
    end
end