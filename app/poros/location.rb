class Location
  attr_reader :lat, :lon, :name
  def initialize(data)
    @name = data[:results].first[:providedLocation][:location]
    @lat = data[:results].first[:locations].first[:latLng][:lat]
    @lon = data[:results].first[:locations].first[:latLng][:lng]
  end

end
