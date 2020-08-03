class TrailsSearch

  def find_trails(location)
    location_object = MapquestSearch.new.find_coords(location) #lat, lon
    weather = OpenWeatherSearch.new.get_weather(location_object.lat, location_object.lon, location)

    trails = HikingProjectService.new.find_trails(location_object.lat, location_object.lon)

  trail_trips  = trails[:trails].each do |trail|
      TrailTrips.new(trail, location)
    end

    TripPlanner.new(location, weather, trail_trips)


  end

end
