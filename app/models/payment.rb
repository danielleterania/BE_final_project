class Payment < ApplicationRecord
  belongs_to :user

  validates :user_id, :year, :month, :amount, :status, presence: true
end
