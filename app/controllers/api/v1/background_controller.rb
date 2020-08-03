class Api::V1::BackgroundController < ApplicationController

  def index
    image = ImageSearch.new.find_image(params[:location])

    render json: DestinationSerializer.new(image)
  end

end
