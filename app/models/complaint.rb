class Complaint < ApplicationRecord
    belongs_to :user
  
    validates :content, presence: true
    validates :response, presence: true
  end
  