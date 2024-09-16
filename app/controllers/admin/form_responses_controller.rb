module Admin
  class FormResponsesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_form_response, only: [:approve, :deny]

    def index
      @form_responses = FormResponse.all
    end

    def new
      @form_response = FormResponse.new
    end

    def create
      @form_response = FormResponse.new(form_response_params)
      if @form_response.save
        redirect_to admin_form_responses_path, notice: 'Form response created successfully.'
      else
        render :new
      end
    end

    def approve
      if @form_response.update(approved: true)
        redirect_to admin_form_responses_path, notice: 'Form response approved.'
      else
        redirect_to admin_form_responses_path, alert: 'Failed to approve the form response.'
      end
    end

    def deny
      if @form_response.update(approved: false)
        redirect_to admin_form_responses_path, notice: 'Form response denied.'
      else
        redirect_to admin_form_responses_path, alert: 'Failed to deny the form response.'
      end
    end

    private

    def set_form_response
      @form_response = FormResponse.find(params[:id])
    end

    def form_response_params
      params.require(:form_response).permit(:form_id, :name, :address, :contact_number, :date, :details)
    end
  end
end
