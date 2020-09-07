class HomeController < ApplicationController
    before_action :get_params, only: [:index, :feedAlbum ,:feedPhoto , :disPhoto, :disAlbum]
    before_action :authenticate_user!
    def newsest
        @albums = Album.order(created_at: :asc).take(4)
        render 'newsest'
    end
    def login 
        render template: "home/login"
    end
    def signup
        render template: "home/signup"
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
            @albums = Album.all.order(created_at: :asc).page(params[:page]).per(6)
            @photos = Photo.all.order(created_at: :asc).page(params[:page]).per(6)
        end
    
    
end
