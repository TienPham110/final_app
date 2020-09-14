class UserController < ApplicationController
    # before_action :get_followers, only: [:followers]
    # before_action :get_followings, only: [:followings]
    before_action :follow_id , only: [:follow, :unfollow]
    before_action :user_id, only: [:edit, :destroy]
    
    def followers
        @user = User.find(user_id)
        render template: 'user/followers'
    end

    def followings
        @user = User.find(user_id)
        render template: 'user/followings'
    end

    def follow
        @user = User.find(follow_id)
        current_user.followings << @user
        redirect_to followers_user_path(id: current_user.id)
    end

    def unfollow #
        @follow = Follow.find_by(follower_id: current_user.id, followed_user_id: follow_id)
        @follow.destroy
        redirect_to followers_user_path(id: current_user.id)
    end

    def edit #
        @user = User.find(user_id)
    end

    def destroy
        @user = User.find(user_id)
        if @user.destroy
            flash.keep[:success] = "Delete completely"
            redirect_to admin_path
        else
            flash.now[:error] = "Delete failed"
            render :show
        end
    end
    

    
    private
        # def get_followers
        #     @followers = current_user.followers.order(created_at: :asc).page(params[:page]).per(8)
        # end
        # def get_followings
        #     @followings = current_user.followings.order(created_at: :asc).page(params[:page]).per(8)
        # end
        def follow_id
            params.require(:follow_id)
        end
        def user_id
            params.require(:id)
        end
        def user_params
            params.require(:user).permit(:firstName, :lastName, :email, :password, :active)
        end
        
end
