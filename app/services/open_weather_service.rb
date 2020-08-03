class OpenWeatherService

  def get_weather(lat, lon)
    response = conn.get('onecall') do |req|
      req.params['lat'] = lat
      req.params['lon'] = lon
      req.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('https://api.openweathermap.org/data/2.5') do |faraday|
      faraday.params['appid'] = ENV['OPEN_WEATHER_API_KEY']
    end

  end

end
