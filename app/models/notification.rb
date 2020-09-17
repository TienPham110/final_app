class Notification < ApplicationRecord

  belongs_to :users
  belongs_to :item, polymorphic: true

  after_create { NotificationBroadcastJob.perform_later(self) } # We make this later

  scope :leatest, ->{order("created_at DESC")}
  scope :unviewed, ->{where(viewed: false)} # This is like a shortcut

  # This returns the number of unviewed notifications
  def self.for_user(user_id)
    Notification.where(user_id: user_id).unviewed.count
  end

end
