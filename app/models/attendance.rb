class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :stripe_customer_id, presence: true
  validates :user_id, uniqueness: { scope: :event_id, message: "est déjà inscrit à cet événement" }

  after_create :send_admin_notification

  private

  def send_admin_notification
    AttendanceMailer.new_participation(self).deliver_now
  end
end

