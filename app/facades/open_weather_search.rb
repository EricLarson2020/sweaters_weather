class OpenWeatherSearch

  def get_weather(lat, lon)
    result = OpenWeatherService.new.get_weather(lat, lon)
    Forecast.new(result)
  end


end
