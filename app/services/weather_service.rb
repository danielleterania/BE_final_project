require 'httparty'

class WeatherService
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5'

  def initialize
    @api_key = '0d1b77039f6bec7389ba7585e7fa0053'
  end

  def current_weather(city = 'Angono')
    response = self.class.get('/weather', query: { q: city, appid: @api_key, units: 'metric' })

    if response.code == 200
      response.parsed_response
    else
      Rails.logger.error "Error fetching weather data: #{response.code} - #{response.message}"
      nil
    end
  end
end
