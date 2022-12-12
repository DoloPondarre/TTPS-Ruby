class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role
  belongs_to :branch, optional: true

  has_many :shifts, foreign_key: 'client_id', dependent: :destroy
  attribute :role_id,  default: '3'
  validates :name, presence: true

  validates :branch, presence: true, if: :staff?

  def admin?
    role.name == 'Admin'
  end
  def staff?
    role.name == 'Staff'
  end
  def client?
    role.name == 'Client'
  end

  delegate :can?, :cannot?, to: :ability

  def ability
    @ability ||= Ability.new(self)
  end
  
end
