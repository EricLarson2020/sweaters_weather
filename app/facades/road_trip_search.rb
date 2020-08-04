class RoadTripSearch

  def get_road_trip_information(to, from)
    coords = MapquestSearch.new.find_coords(to)
    forecast = OpenWeatherSearch.new.get_weather(coords.lat, coords.lon, to)
    travel_time = MapquestService.new.get_travel_time(to, from)
    TripPlanner.new(to, from, forecast, travel_time)
  end

end
