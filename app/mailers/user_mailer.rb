class UserMailer < ApplicationMailer
    default from: ENV['GMAIL_LOGIN']
  
    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: "Bienvenue sur votre Eventbrite Clone !")
    end
  end
  
