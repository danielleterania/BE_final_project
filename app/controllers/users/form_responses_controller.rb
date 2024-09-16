module Users
  class FormResponsesController < ApplicationController
    before_action :authenticate_user!

    def index
      @form = Form.find(params[:form_id])
      @form_responses = @form.form_responses.where(user: current_user)
    end

  end
end
