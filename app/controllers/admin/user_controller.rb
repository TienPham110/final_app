module Admin 
    class UserController < ApplicationController
        before_action :check_admin, only: [:show]

        PER_PAGE = 40

        def show #
            @users = User.where.not(admin:true).page(params[:page]).per(PER_PAGE)
        end

        def edit #
            @user = User.find(params[:user_id])
        end
        
        def update #
            @user = User.find(params[:user_id])
            if @user.update(user_params)
                flash[:success] = "Update successful"
                redirect_to admin_user_path
            else
                flash[:error] = "Update failed"
                redirect_to edit_admin_user_path(user_id: params[:user_id])
            end
        end

        def destroy
            @user = User.find(params[:user_id])
            if @user.destroy
                flash[:success] = "Delete successful"
                redirect_to admin_user_path
            else 
                flash[:error] = "Delete failed"
                redirect_to admin_user_path
            end
        end
            
        private
        def check_admin
            unless current_user.admin?
                redirect_to user_path(current_user.id)
            end
        end
        def user_params
            params.require(:user).permit(:firstName, :lastName, :email, :password, :active)
        end
         
    end
end