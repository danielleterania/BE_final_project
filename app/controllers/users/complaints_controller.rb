module Users
  class ComplaintsController < ApplicationController
    before_action :authenticate_user!

    def index
      @complaints = current_user.complaints
      @complaint = Complaint.new
    end

    def create
      @complaint = current_user.complaints.new(complaint_params)
      if @complaint.save
        redirect_to users_complaints_path, notice: 'Complaint filed successfully.'
      else
        render :index
      end
    end

    def show
      @complaint = current_user.complaints.find(params[:id])
    end

    private

    def complaint_params
      params.require(:complaint).permit(:content)
    end
  end
end
