class AttendanceMailer < ApplicationMailer
    default from: ENV['GMAIL_LOGIN']
  
    def new_participation(attendance)
      @attendance = attendance
      @event = attendance.event
      @admin = @event.admin
      mail(to: @admin.email, subject: "Nouvelle participation à #{@event.title}")
    end
  end
  
