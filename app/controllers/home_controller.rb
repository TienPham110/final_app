class HomeController < ApplicationController
    before_action :get_params, only: [:index, :feedAlbum ,:feedPhoto , :disPhoto, :disAlbum]
    def newsest
        @albums = Album.order(created_at: :asc).take(4)
        render 'newsest'
    end
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
        def get_params
            @albums = Album.all.order(created_at: :asc)
            @photos = Photo.all.order(created_at: :asc)
        end
    
    
end
