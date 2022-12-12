class Schedule < ApplicationRecord
  enum :day, { Sunday: 0, Monday: 1, Tuesday: 2, Wendnesday: 3, Thursday: 4, Friday: 5, Saturday: 6 }
  validates :day, :hourI, :hourF, presence: true
  validate :validar_hora

  attribute :day,  default: 0
  attribute :hourI,  default: '8:00'
  attribute :hourF,  default: '15:00'
  belongs_to :branch

  def validar_hora
    if hourF <= hourI
      errors.add(:hourF, "La hora de cierre debe ser posterior a la de apertura.")
    end
  end
end
