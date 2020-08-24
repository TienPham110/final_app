class Follow < ApplicationRecord
    #user who follow us
    belongs_to :follower, foreign_key: :follower_id , class_name: "User"
    #user who we follow
    belongs_to :followed_user, foreign_key: :followed_user_id, class_name: "User"
end 
