class User < ApplicationRecord
    # Devise modules
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  
    # Un utilisateur peut organiser plusieurs événements (admin)
    has_many :organized_events, class_name: "Event", foreign_key: "admin_id", dependent: :destroy
  
    # Un utilisateur peut avoir plusieurs participations via attendances
    has_many :attendances, dependent: :destroy
    has_many :participated_events, through: :attendances, source: :event
  end
  
  