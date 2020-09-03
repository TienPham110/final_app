class UserMailer < ApplicationMailer
    default from: 'phamhongtien19@gmail.com'

    def welcome_email user
        @user = user 
        mail(to: @user.email, subject: "Welcome #{@user.firstName}", body: "Congrats #{@user.firstName}! Welcome to NUS f**king world.")        
    end
end
