module Admin
    class FormResponsesController < ApplicationController
      before_action :authenticate_user!
  
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
  
      private
  
      def form_response_params
        params.require(:form_response).permit(:form_id, :name, :address, :contact_number, :date, :details)
      end
    end
  end
  