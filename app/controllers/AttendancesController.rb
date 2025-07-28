class AttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def create
    @attendance = @event.attendances.new(user: current_user)
    # TODO: gérer stripe_customer_id ou l’enlever temporairement

    if @attendance.save
      redirect_to @event, notice: "Participation enregistrée !"
    else
      redirect_to @event, alert: @attendance.errors.full_messages.to_sentence
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end


  
  