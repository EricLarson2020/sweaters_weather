class HikingProjectService

  def find_trails(lat, lon)
    response = conn.get('get-trails') do |req|
      req.params['lat'] = "#{lat}"
      req.params['lon'] = "#{lon}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('https://www.hikingproject.com/data') do |faraday|
      faraday.params['key'] = ENV['HIKING_PROJECT_API_KEY']
    end
  end

end
