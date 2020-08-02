class OpenWeatherSearch

  def get_weather(lat, lon)
    result = OpenWeatherService.new.get_weather(lat, lon)
    Weather.new(result)
  end


end
