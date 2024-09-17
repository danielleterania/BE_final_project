class Complaint < ApplicationRecord
  belongs_to :user
  has_many :responses, dependent: :destroy

  validates :content, presence: true
end
