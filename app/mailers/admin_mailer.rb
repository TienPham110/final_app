class AdminMailer < ApplicationMailer
    default to: ->{User.pluck(:email)},
            from: 'phamhongtien19@gmail.com'
    
    def send_multi user
        @user = user
        mail(subject:"hello: #{@user.firstName}")
    end
            
end
