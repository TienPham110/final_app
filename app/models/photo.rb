class Photo < ApplicationRecord
    #############association###################
    belongs_to :user, counter_cache: :photos_count
    belongs_to :album, optional: true
    has_many :likes, :as => :likeable, dependent: :destroy

    #############validation####################
    validates :title, presence: true, length:{maximum: 140}
    validates :description, length:{maximum: 300}
    validates :image, presence: true

    #############Upload photo##################
    mount_uploader :image, ImageUploader

end
