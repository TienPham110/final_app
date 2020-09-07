class Photo < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :albums

    has_many :likes, :as => :likeable, dependent: :destroy
    validates :title, presence: true, length:{maximum: 255}
    validates :description, length:{maximum: 255}
    mount_uploader :image, ImageUploader
end
