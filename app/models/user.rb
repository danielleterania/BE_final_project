class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true

  has_many :payments
  has_many :complaints

  attribute :approved, :boolean, default: false
  attribute :declined, :boolean, default: false
  attribute :admin, :boolean, default: false

  def admin?
    admin
  end
end
