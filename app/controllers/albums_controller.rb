class AlbumsController < ApplicationController
    def index
        
    end
    def edit
        @albums = Album.find_by(params[:id])
    end
    def update 
        
        @a = Album.find(params[:id])
        @a.title = title_params
        @a.save
        @albums = Album.all
        render :show
    end
    def show
        
    end
    private 
        def title_params
            params.require(:album).permit(:title)[:title]
        end
    
    
    
end
