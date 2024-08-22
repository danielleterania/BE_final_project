class Users::SessionsController < Devise::SessionsController
  # after_action :redirect_based_on_email, only: :create

  # private

  # def redirect_based_on_email
  #   if current_user.email == 'admin@example.com'
  #     redirect_to admin_root_path
  #   else
  #     redirect_to homeowners_path
  #   end
  # end
end
