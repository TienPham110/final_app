class HomeController < ApplicationController
    def index
        
    end
    def newsest
        @albums = Album.order(created_at: :asc).take(4)
        render 'newsest'
    end
    
end
