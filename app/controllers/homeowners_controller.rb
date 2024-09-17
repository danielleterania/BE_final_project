class HomeownersController < ApplicationController
  before_action :authenticate_user!
  

  def index
    @weather_service = WeatherService.new
    @weather = @weather_service.current_weather('Angono')

    if @weather.nil?
      flash[:alert] = 'Unable to fetch weather data. Please try again later.'
    end
  end
end