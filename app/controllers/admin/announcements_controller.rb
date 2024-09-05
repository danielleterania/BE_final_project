module Admin
  class AnnouncementsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin

    def index
      @announcements = Announcement.all
      @announcement = Announcement.new
    end

    def create
      @announcement = Announcement.new(announcement_params)
      if @announcement.save
        redirect_to admin_announcements_path, notice: 'Announcement created.'
      else
        render :index
      end
    end

    def destroy
      @announcement = Announcement.find(params[:id])
      @announcement.destroy
      redirect_to admin_announcements_path, notice: 'Announcement deleted.'
    end

    private

    def announcement_params
      params.require(:announcement).permit(:title, :content)
    end

    def authorize_admin
      redirect_to root_path unless current_user.email == 'admin@example.com'
    end
  end
end
