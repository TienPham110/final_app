class AdminController < ApplicationController
    before_action :check_admin, only: [:show]
    
    PER_PAGE = 20

    def show #
        @user = User.find(params[:id])

        @photos = Photo.all.order(updated_at: :desc).page(params[:page]).per(PER_PAGE)

        @albums = Album.all.order(updated_at: :desc).page(params[:page]).per(PER_PAGE)

        @users = User.where.not(admin:true)
    end

    private
        def check_admin
            unless current_user.admin?
                redirect_to user_path(current_user.id)
            end
        end
end