class Photo < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :albums

    has_many :likes, :as => :likeable
    validates :title, presence: true, length:{maximum: 255}
    validates :description, length:{maximum: 255}
end
