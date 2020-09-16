class HomeController < ApplicationController

    PER_PAGE = 6

    def feedAlbum
        @albums = Album.where(shared:true, user_id: current_user.followings.ids).order(updated_at: :desc).page(params[:page]).per(PER_PAGE)
        render template: "feed/albums"
    end

    def feedPhoto
        @photos = Photo.where(shared:true, album_id:nil,user_id: current_user.followings.ids).order(updated_at: :desc).page(params[:page]).per(PER_PAGE)
        render template: "feed/photos"   
    end

    def disPhoto
        @photos = Photo.where(shared: true, album_id: nil).where.not(user_id: current_user.id).order(updated_at: :desc).page(params[:page]).per(PER_PAGE)
        render template: "discovery/photos"
    end
    
    def disAlbum    
        @albums = Album.where(shared:true).where.not(user_id: current_user.id).order(updated_at: :desc).page(params[:page]).per(PER_PAGE)
        render template: "discovery/albums"
    end 
    
end
