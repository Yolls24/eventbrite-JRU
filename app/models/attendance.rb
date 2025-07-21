class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
  after_create :send_admin_notification

  validates :stripe_customer_id, presence: true

  private
  def send_admin_notification
    AttendanceMailer.new_participation(self).deliver_now
  end
end
