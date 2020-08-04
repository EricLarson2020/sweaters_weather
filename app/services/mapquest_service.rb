class MapquestService

  def get_coords(location)
    response = conn.get('geocoding/v1/address') do |req|
      req.params['location'] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_travel_time(to, from)

    response = conn.get('directions/v2/route') do |req|
      req.params['to'] = to
      req.params['from'] = from
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('http://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['MAPQUEST_API_KEY']
    end
  end


end
