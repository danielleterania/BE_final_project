module Users
  class ComplaintsController < ApplicationController
    before_action :authenticate_user!

    def create
      @complaint = current_user.complaints.new(complaint_params)
      if @complaint.save
        # Trigger a Pusher event when a new complaint is created
        Pusher.trigger('complaints-channel', 'new-complaint', {
          complaint_id: @complaint.id,
          content: @complaint.content
        })
        redirect_to users_complaints_path, notice: 'Complaint filed successfully.'
      else
        render :index
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
