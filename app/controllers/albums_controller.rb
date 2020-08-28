class AlbumsController < ApplicationController
    def index
        
    end
    def edit
        @albums = Album.find_by(params[:id])
    end
    def update 
        
        @a = Album.find(params[:id])
        @a.title = params[:album][:title]
        @a.save
        @albums = Album.all
        render :show
    end
    def show
        
    end
    
    
    
end
