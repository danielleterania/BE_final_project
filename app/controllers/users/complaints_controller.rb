module Users
  class ComplaintsController < ApplicationController
    before_action :authenticate_user!

    def create
      @complaint = current_user.complaints.new(complaint_params)
      if @complaint.save
        redirect_to users_profile_path, notice: 'Complaint filed successfully.'
      else
        redirect_to users_profile_path, alert: 'Failed to file complaint.'
      end
    end

    def index
      @complaints = current_user.complaints
    end

    private

    def complaint_params
      params.require(:complaint).permit(:content)
    end
  end
end
