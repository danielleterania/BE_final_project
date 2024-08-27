module Admin
  class UserApprovalsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin

    def index
      @users = User.where(approved: false) # Fetch unapproved users
    end

    def approve
      user = User.find(params[:id])
      user.update(approved: true)
      redirect_to admin_user_approvals_path, notice: 'User approved.'
    end

    private

    def authorize_admin
      redirect_to root_path unless current_user.email == 'admin@example.com'
    end
  end
end
