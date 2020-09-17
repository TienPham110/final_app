class SearchController < ApplicationController
    PER_PAGE = 5

    def show #
        @photos = []
        @albums = []
        unless params[:search].blank?
            @photos = Photo.where("description LIKE ? OR title LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").order(updated_at: :desc).page(params[:page]).per(PER_PAGE)
            @albums = Album.where("description LIKE ? OR title LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").order(updated_at: :desc).page(params[:page]).per(PER_PAGE)
            unless @photos.count != 0 || @albums.count != 0
                flash.now[:error] = "Not found '#{params[:search]}'"
            end
            render template: 'search/show'
        else
            flash.now[:error] = "you have to enter keyword"
            render template: 'search/show'
        end
    end
end
