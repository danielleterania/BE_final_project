module Admin
  class AboutUsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin

    def edit
      @about_u = AboutU.first_or_initialize
    end

    def update
      @about_u = AboutU.first_or_initialize
      if @about_u.update(about_us_params)
        redirect_to admin_root_path, notice: 'About Us page updated.'
      else
        render :edit
      end
    end

    private

    def about_u_params
      params.require(:about_us).permit(:content)
    end

    def authorize_admin
      redirect_to root_path unless current_user.email == 'admin@example.com'
    end
  end
end
