class MapQuestService

  def get_distance(to, from)
    response = conn.get('route') do |req|
      req.params['to'] = "#{to}"
      req.params['from'] = "#{from}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('http://www.mapquestapi.com/directions/v2') do |faraday|
      faraday.params['key'] = ENV['MAPQUEST_API_KEY']
    end
  end


end
