class Shift < ApplicationRecord
  validates :date, :time, :reason, presence: true #, uniqueness: true
  validate :time_branch, :turn_valid

  belongs_to :client, class_name:'User', foreign_key: 'client_id', required: true
  belongs_to :staff, class_name:'User', foreign_key: 'staff_id', required: false
  belongs_to :branch

  attribute :comment,  default: "Fixed"

  before_save :assign_state

  def time_branch
    if (self.staff_id.nil?)
      unless date.nil? && time.nil?
        day = date.strftime('%A')
        unless (Schedule.find_by(branch_id: branch_id, day: day).nil?)
          ti = Schedule.find_by(branch_id: branch_id, day: day).hourI.strftime('%H%M')
          tf = Schedule.find_by(branch_id: branch_id, day: day).hourF.strftime('%H%M')
          unless ((ti..tf) === time.strftime('%H%M'))
            errors.add(:time, message: "El horario seleccionado no se encuentra dentro del horario de atención de la sucursal seleccionada.")
          end
        end
      end
    end
  end

  def turn_valid
    if (self.staff_id.nil?)
      unless Shift.find_by(branch_id: branch_id, date: date, time: time).nil?
        errors.add(:date, message: "Turno no disponible en la sucursal seleccionada.")
      end
    end
  end

  def assign_state
    self.state = 'Pendiente' if state.nil?
  end

end