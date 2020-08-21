class Album < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :photos
    validates :title, presence: true, length:{maximum: 255}
    validates :description, length:{maximum: 255}

    before_validation :check_if_album_has_a_description
    
    private
        def check_if_album_has_a_description
            if description.blank?
                self.description = "This is a album of user has id #{user_id}"
            end
        end
end
