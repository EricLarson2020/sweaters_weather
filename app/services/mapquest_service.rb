class MapquestService

  def get_coords(location)
    response = conn.get('address') do |req|
      req.params['location'] = location
    end

    JSON.parse(response.body, symbolize_names: true)
  end



  private

  def conn
    Faraday.new('http://www.mapquestapi.com/geocoding/v1') do |faraday|
      faraday.params['key'] = ENV['MAPQUEST_API_KEY']
    end
  end


end
