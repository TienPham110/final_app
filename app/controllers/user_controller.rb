class UserController < ApplicationController
    
    def followers
        @user = User.find(params[:id])
        render template: 'user/followers'
    end

    def followings
        @user = User.find(params[:id])
        render template: 'user/followings'
    end

    def toggleFollow #follow and unfollow user
        if current_user.followings.pluck(:id).include?(params[:follow_id].to_i)
            @follow = Follow.find_by(follower_id: current_user.id, followed_user_id: params[:follow_id])
            @follow.destroy
        else
            @user = User.find(params[:follow_id])
            current_user.followings << @user
        end
    end

    # def edit #
    #     @user = User.find(user_id)
    # end

    # def destroy
    #     @user = User.find(user_id)
    #     if @user.destroy
    #         flash.keep[:success] = "Delete completely"
    #         redirect_to admin_path
    #     else
    #         flash.now[:error] = "Delete failed"
    #         render :show
    #     end
    # end
    

    private
        def user_params
            params.require(:user).permit(:firstName, :lastName, :email, :password, :active)
        end
        
end
