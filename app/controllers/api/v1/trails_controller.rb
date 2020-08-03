class Api::V1::TrailsController < ApplicationController

  def index
    TrailsSearch.new.find_trails(params[:location])
  end

end
