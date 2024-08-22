class ApplicationController < ActionController::Base
  
    def after_sign_in_path_for(resource)
      if resource.email == 'admin@example.com'
        admin_root_path
      else
        homeowners_path
      end
    end
  end
  