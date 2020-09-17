class NotificationsController < ApplicationController
    
    def index
        @notifications = Notification.where(user: current_user).unviewed.leatest
    
        respond_to do |format|
          format.html
          format.js
        end
    end
    
    def update
        @notification = Notification.find(params[:id])
    
        message = @notification.update(notification_params) ? "Viewed notification" : "There was an error"
    
        redirect_to :back, notice: message
    end
    
    private
        def notification_params
            params.require(:notification).permit(:viewed)
        end
end
