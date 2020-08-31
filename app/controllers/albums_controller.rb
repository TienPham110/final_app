class AlbumsController < ApplicationController
    def index
        
    end
    def edit
        @albums = Album.find_by(params[:id])
    end
    def update 
        @albums = Album.find_by(params[:id])
        @a = Album.find(params[:id])
        @a.title = title_params
            if @a.save
                @album = Album.all
                render :show
            else
                flash[:error] = "Update fail"
                redirect_to action: :edit
            end
    end
    def show
        
    end
    private 
        def title_params
            params.require(:album).permit(:title)[:title]
        end
     
end