# test/mailers/previews/attendance_mailer_preview.rb
class AttendanceMailerPreview < ActionMailer::Preview
    def new_participation
      # On récupère un attendance existant ou on en crée un factice pour la preview
      attendance = Attendance.first || Attendance.new(
        stripe_customer_id: "cus_preview_123",
        user: User.first || User.new(email: "participant@example.com", password: "password123"),
        event: Event.first || Event.new(
          title: "Soirée Ruby",
          description: "Apéro dev Ruby convivial à 18h !",
          start_date: 2.days.from_now,
          duration: 120,
          price: 10,
          location: "Ma ville",
          admin: User.first || User.new(email: "admin@example.com", password: "password123")
        )
      )
  
      AttendanceMailer.new_participation(attendance)
    end
  end
  
