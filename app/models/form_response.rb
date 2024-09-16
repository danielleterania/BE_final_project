class FormResponse < ApplicationRecord
  belongs_to :form
  belongs_to :user

  validates :name, :address, :contact_number, :date, :details, presence: true
end
