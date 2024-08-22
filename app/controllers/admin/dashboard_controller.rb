module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin

    def index
    end

    private

    def authorize_admin
      redirect_to root_path unless current_user.email == 'admin@example.com'
    end
  end
end
