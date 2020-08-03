class ImageSearch

  def find_image(destination)
    response = ImageService.new.find_image(location)
    Destination.new(response)
  end

end
