class Album < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :photos

    has_many :likes, :as => :likeable, dependent: :destroy
    validates :title, presence: true, length:{minimum: 10}
    validates :description, length:{maximum: 255}

    # before_validation :check_if_album_has_a_description
    
    # private
    #     def check_if_album_has_a_description
    #         if title.blank?
    #             self.title = "This is a album of user has id #{user_id}"
    #         end
    #     end
end
