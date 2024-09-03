module Admin
  class ComplaintsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin

    def index
      @complaints = Complaint.all
    end

    def respond
      @complaint = Complaint.find(params[:id])
      if @complaint.update(complaint_params)
        # Trigger a Pusher event when a complaint is updated
        Pusher.trigger('complaints-channel', 'complaint-updated', {
          complaint_id: @complaint.id,
          content: @complaint.content,
          response: @complaint.response
        })
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
