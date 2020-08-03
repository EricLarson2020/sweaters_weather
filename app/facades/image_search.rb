class ImageSearch

  def find_image(destination)
    response = ImageService.new.find_image(destination)
    Destination.new(response, destination)
  end

end
