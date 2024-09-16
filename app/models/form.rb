# app/models/form.rb
class Form < ApplicationRecord
    has_many :form_responses, dependent: :destroy
  end
  
  # app/models/form_response.rb
  class FormResponse < ApplicationRecord
    belongs_to :form
    belongs_to :user
  end
  