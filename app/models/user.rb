class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

    ######################Devise########################
    devise :database_authenticatable, :registerable,
           :recoverable, :confirmable, :trackable
    def active_for_authentication?
    super && self.active? 
    end

    ######################association###################
    has_many :photos, dependent: :destroy
    has_many :albums, dependent: :destroy
    has_many :likes, dependent: :destroy

    # Will return an array of follows for the given user instance
    has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"
    # Will return an array of users who follow the user instance
    has_many :followers, through: :received_follows, source: :follower
    # returns an array of follows a user gave to someone else
    has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"
    # returns an array of other users who the user has followed
    has_many :followings, through: :given_follows, source: :followed_user

    ######################Validation####################
    validates :firstName, :lastName, :email, :password, presence: true
    validates :firstName, :lastName, length: {maximum: 25}
    validates :email, length: {maximum:255, too_long: "%{count} characters is the maximum allowed"}, uniqueness:{case_sensitive: false}, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "only allows email"}
    validates :password, length: {in: 8..64}

    ####################upload avatar###################
    mount_uploader :avatar, AvatarUploader

    ####################send mail#######################
    after_create :create_user

    ###################Method###########################
    def name 
      [firstName, lastName].select(&:present?).join(' ')
    end

    def avatar_name
      [firstName.chars.first, lastName.chars.first].compact.join
    end
    
    private
        def create_user
            SendMailJob.perform_now(self)
        end
   
end
