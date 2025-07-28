class Event < ApplicationRecord
  belongs_to :admin, class_name: "User"

  has_many :attendances, dependent: :destroy
  has_many :participants, through: :attendances, source: :user

  validates :start_date, presence: true
  validate :start_date_cannot_be_in_past

  validates :duration, presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validate :duration_must_be_multiple_of_five

  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }

  validates :price, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }

  validates :location, presence: true

  has_one_attached :cover_image

  # Ajout de la méthode pour vérifier l'inscription d'un utilisateur
  def registered?(user)
    participants.exists?(user.id)
  end

  def cover_image_url
    cover_image.attached? ? Rails.application.routes.url_helpers.rails_blob_path(cover_image, only_path: true) : nil
  end
  
  private

  def start_date_cannot_be_in_past
    if start_date.present? && start_date < Time.current
      errors.add(:start_date, "ne peut pas être dans le passé")
    end
  end

  def duration_must_be_multiple_of_five
    if duration.present? && duration % 5 != 0
      errors.add(:duration, "doit être un multiple de 5")
    end
  end
end



