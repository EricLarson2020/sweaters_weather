class Destination
  attr_reader :url, :id, :location
  def initialize(data, destination)
    @url = data[:results].first[:urls][:full]
    @location = destination
    @id = nil

  end
end
