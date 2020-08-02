class MapquestSearch

  def find_coords(location)
    result = MapquestService.new.get_coords(location)
    Location.new(result)
  end

end
