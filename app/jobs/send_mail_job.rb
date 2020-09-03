class SendMailJob < ApplicationJob
  queue_as :default

  def perform user
    # Do something later
    @user = user 
    UserMailer.welcome_email(@user).deliver_now
  end
end
