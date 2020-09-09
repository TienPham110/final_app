class LikesController < ApplicationController
    def create 
        params[:like][:user_id] = current_user.id
        @like = Like.new like_params
        if @like.save 
            flash[:success] = 'liked'
        else 
            flash[:alert] = @like.errors.full_messages.join(", ")
        end
    end
    def destroy
        @like = current_user.likes.find(params[:id])
        @like.destroy
    end
    private
        def like_params
            params.require(:like).permit(:likeable_id, :likeable_type, user_id)
        end
end