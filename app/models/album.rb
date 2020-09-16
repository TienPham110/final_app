class Album < ApplicationRecord
    ################association############
    belongs_to :user, counter_cache: :albums_count
    has_many :photos, dependent: :destroy
    has_many :likes, :as => :likeable, dependent: :destroy

    ################validation#############
    validates :title, presence: true, length:{maximum: 140}
    validates :description, length:{maximum: 300}
end
