class Branch < ApplicationRecord
    validates :name, :direction, :telephone, presence: true
    validates :name, uniqueness: true
    validates :telephone, numericality: true
end
