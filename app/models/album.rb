class Album < ApplicationRecord
    belongs_to :user, counter_cache: :albums_count
    has_many :photos, dependent: :destroy
    

    has_many :likes, :as => :likeable, dependent: :destroy
    validates :title, presence: true, length:{maximum: 140}
    validates :description, length:{maximum: 300}
    # before_validation :check_if_album_has_a_description
    
    # private
    #     def check_if_album_has_a_description
    #         if title.blank?
    #             self.title = "This is a album of user has id #{user_id}"
    #         end
    #     end
end
