class HomeController < ApplicationController
    before_action :get_params, only: [:index, :feed, :discovery]
    def newsest
        @albums = Album.order(created_at: :asc).take(4)
        render 'newsest'
    end
    def feed
        if params[:type] == 'p'
            render template: "feed/photos"
        else
            render template: "feed/albums"
        end
    end
    def discovery
        
        if params[:type] == 'p'
            render template: "discovery/photos"
        else
            render template: "discovery/albums"
        end
    end

    private
        def get_params
            @albums = Album.all
            @photos = Photo.all
        end
    
    
end
