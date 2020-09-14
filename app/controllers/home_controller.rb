class HomeController < ApplicationController
    before_action :show_photo, only: [:feedPhoto , :disPhoto]
    before_action :show_album, only: [:feedAlbum , :disAlbum]
    
    def feedAlbum
        render template: "feed/albums"
    end

    def feedPhoto
        render template: "feed/photos"   
    end

    def disPhoto
        render template: "discovery/photos"
    end
    
    def disAlbum
        render template: "discovery/albums"
    end

    private
        def show_photo  
            @photos = Photo.where(shared:true,album_id:nil).order(created_at: :desc).page(params[:page]).per(6)  
        end

        def show_album
            @albums = Album.where(shared:true).order(created_at: :desc).page(params[:page]).per(6)
        end
    
    
end
