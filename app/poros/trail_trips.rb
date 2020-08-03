class TrailTrips
  attr_reader :name, :summary, :difficulty, :location, :distance_to_trail
  def initialize(data, location)
    @name = data[:name]
    @summary = data[:summary]
    @difficulty = data[:difficulty]
    @location = data[:location]
    @distance_to_trail = get_distance(data, location)
  end

  def get_distance(data, location)
    result = MapquestSearch.new.get_distance(data[:location], location)
    result[:route][:distance]
  end
end
