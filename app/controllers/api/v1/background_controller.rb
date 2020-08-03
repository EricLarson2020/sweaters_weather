class BackgroundController < ApplicationController

  def index
    ImageSearch.new.find_image(params[:location])
  end

end
