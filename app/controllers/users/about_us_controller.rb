module Users
  class AboutUsController < ApplicationController
    before_action :authenticate_user!

    def show
      @about_u = AboutU.first
    end
  end
end
