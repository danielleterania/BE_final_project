module Users
  class FormsController < ApplicationController
    before_action :authenticate_user!

    def index
      @forms = Form.all # Fetch forms created by admin
    end

    def show
      @form = Form.find(params[:id])
    end

    def create
      @form = Form.new(form_params)
      @form.user = current_user
      if @form.save
        redirect_to users_forms_path, notice: 'Form submitted successfully.'
      else
        render :index
      end
    end

    private

    def form_params
      params.require(:form).permit(:content) # Adjust as needed
    end
  end
end
