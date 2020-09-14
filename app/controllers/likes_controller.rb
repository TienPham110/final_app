class LikesController < ApplicationController

    def like #
        Like.create(user_id: current_user.id, likeable_id: photoId_params)

    end

    def unlike #
        Like.find_by(user_id: current_user.id, likeable_id: photoId_params).destroy
    end

    private
        def photoId_params
            
        end
end