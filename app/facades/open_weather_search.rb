class OpenWeatherSearch

  def get_weather(lat, lon, name)
    result = OpenWeatherService.new.get_weather(lat, lon)
    Forecast.new(result, name)
  end


end
