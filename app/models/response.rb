class Response < ApplicationRecord
  belongs_to :complaint

  validates :content, presence: true
end
