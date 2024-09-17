module Admin
  class ComplaintsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin

    def index
      @complaints = Complaint.all
    end

    def show
      @complaint = Complaint.find(params[:id])
    end

    def respond
      @complaint = Complaint.find(params[:id])
      if @complaint.update(complaint_params)
        redirect_to admin_complaints_path, notice: 'Complaint updated.'
      else
        render :index
      end
    end

    private

    def complaint_params
      params.require(:complaint).permit(:response)
    end

    def authorize_admin
      redirect_to root_path unless current_user.email == 'admin@example.com'
    end
  end
end
