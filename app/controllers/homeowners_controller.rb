class HomeownersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_homeowner

  def index
  end

  private

  def authorize_homeowner
    redirect_to root_path if current_user.email == 'admin@example.com'
  end
end
