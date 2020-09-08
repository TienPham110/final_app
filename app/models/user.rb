class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :confirmable
    has_many :photos, dependent: :destroy
    has_many :albums, dependent: :destroy

      # Will return an array of follows for the given user instance
     has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"

     # Will return an array of users who follow the user instance
     has_many :followers, through: :received_follows, source: :follower
  
        #####################
  
    # returns an array of follows a user gave to someone else
     has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"
  
    # returns an array of other users who the user has followed
    has_many :followings, through: :given_follows, source: :followed_user

    has_many :likes, dependent: :destroy

    validates :firstName, :lastName, :email, :password, presence: true
    validates :firstName, :lastName, length: {maximum: 25}
    validates :email, length: {maximum:255, too_long: "%{count} characters is the maximum allowed"}, uniqueness:{case_sensitive: false}, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "only allows email"}
    validates :password, length: {in: 8..64}
    after_create :create_user
    private
        def create_user
            puts "ok"
            SendMailJob.perform_now(self)
        end
end
