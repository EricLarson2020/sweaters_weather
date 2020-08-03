class TripPlanner
  attr_reader :location, :forecast, :trails, :id
  def initialize(location, weather, trail_trips)
    @location = location
    @forecast = formated_forecast(weather)
    @trails = trail_trips
    @id = nil
  end

  def formated_forecast(weather)
    {
      summary: weather.current[:weather].first[:description],
      temperature: weather.current[:temp]
    }
  end

end
