module Users
    class FormResponsesController < ApplicationController
      before_action :authenticate_user!
  
      def index
        @form_responses = FormResponse.all
      end
    end
  end
  