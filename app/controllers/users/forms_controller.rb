module Users
  class FormsController < ApplicationController
    before_action :authenticate_user!

    def index
      @forms = Form.all # Fetch all forms, regardless of approval status
    end

    def show
      @form = Form.find(params[:id])
      @form_response = FormResponse.new
    end

    def create
      @form_response = FormResponse.new(form_response_params)
      @form_response.user = current_user

      if @form_response.save
        redirect_to users_forms_path, notice: 'Form submitted successfully.'
      else
        render :show
      end
    end

    private

    def form_response_params
      params.require(:form_response).permit(:form_id, :name, :address, :contact_number, :date, :details)
    end
  end
end
