class TrailsSearch

  def find_trails(location)
    location_object = MapquestSearch.new.find_coords(location)
    weather = OpenWeatherSearch.new.get_weather(location_object.lat, location_object.lon, location)
    trail_trips = get_trails(location_object.lat, location_object.lon, location)
    answer = TripPlanner.new(location, weather, trail_trips)
  end


  def get_trails(lat, lon, location)
    trails = HikingProjectService.new.find_trails(lat, lon)

    trail_trips = trails[:trails].map do |trail|
      TrailTrips.new(trail, location)
    end
  end


end
