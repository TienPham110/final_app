class User < ApplicationRecord
    has_many :photos
    has_many :albums
    validates :firstName, :lastName, :email, :password, presence: true
    validates :firstName, :lastName, length: {maximum: 25}
    validates :email, length: {maximum:255, too_long: "%{count} characters is the maximum allowed"}, uniqueness:{case_sensitive: false}, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "only allows email"}
    validates :password, length: {in: 8..64}
end
