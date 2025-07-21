class AttendancesController < ApplicationController
    before_action :authenticate_user!  # Assure-toi que seul un utilisateur connecté peut participer
  
    def new
      @attendance = Attendance.new
    end
  
    def create
      @attendance = Attendance.new(attendance_params)
      @attendance.user = current_user
  
      if @attendance.save
        redirect_to @attendance.event, notice: "Participation enregistrée !"
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def attendance_params
      params.require(:attendance).permit(:event_id, :stripe_customer_id)
    end
  end
  
  