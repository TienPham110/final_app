# class NotificationChannel < ApplicationCable::Channel
#   def subscribed
#     # stream_from "some_channel"
#     stream_from "notifications.#{current_user.id}" # in this way we identify to the user inside the channel laters
#   end

#   def unsubscribed
#     # Any cleanup needed when channel is unsubscribed
#   end
# end
