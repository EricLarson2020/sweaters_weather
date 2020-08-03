class TrailsSearch

  def find_trails(location)
    location_object = MapquestSearch.new.find_coords(location) #lat, lon
    weather = OpenWeatherSearch.new.get_weather(location_object.lat, location_object.lon)

    trails = HikingProjectService.new.find_trails(location_object.lat, location_object.lon)
    binding.pry


  end

end
