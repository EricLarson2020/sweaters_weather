class MapquestSearch

  def find_coords(location)
    result = MapquestService.new.get_coords(location)
    Location.new(result)
  end

  def get_distance(to, from)
    result = MapQuestService.new.get_distance(to, from)
    
  end
end
