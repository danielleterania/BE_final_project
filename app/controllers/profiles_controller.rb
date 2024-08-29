class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @payments = @user.payments # Fetch user's payment status
    @complaints = @user.complaints # Fetch user's complaints and suggestions
  end
end

