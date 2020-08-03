class ImageService

  def find_image(location)
    response = conn.get('search/photos') do |req|
      req.params['query'] = location.split(",").first

    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("https://api.unsplash.com") do |faraday|
      faraday.params['client_id'] = ENV['UNSPLASH_API_KEY']
    end
  end

end
