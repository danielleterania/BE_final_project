# app/controllers/admin/form_approvals_controller.rb
module Admin
  class FormApprovalsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin
    before_action :set_form, only: [:show, :edit, :update, :approve, :deny]

    def index
      @forms = Form.all
    end

    def new
      @form = Form.new
    end

    def create
      @form = Form.new(form_params)
      if @form.save
        redirect_to admin_form_approvals_path, notice: 'Form created successfully.'
      else
        render :new
      end
    end

    def show
      @form_responses = @form.form_responses
    end

    def edit
    end

    def update
      if @form.update(form_params)
        redirect_to admin_form_approvals_path, notice: 'Form updated successfully.'
      else
        render :edit
      end
    end

    def approve
      if @form.update(approved: true)
        redirect_to admin_form_approvals_path, notice: 'Form approved.'
      else
        redirect_to admin_form_approvals_path, alert: 'Failed to approve the form.'
      end
    end

    def deny
      if @form.update(approved: false)
        redirect_to admin_form_approvals_path, notice: 'Form denied.'
      else
        redirect_to admin_form_approvals_path, alert: 'Failed to deny the form.'
      end
    end

    private

    def set_form
      @form = Form.find(params[:id])
    end

    def form_params
      params.require(:form).permit(:title, :name, :address, :contact_number, :date, :details)
    end

    def authorize_admin
      redirect_to root_path unless current_user.email == 'admin@example.com'
    end
  end
end
