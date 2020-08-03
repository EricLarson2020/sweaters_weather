class Api::V1::TrailsController < ApplicationController

  def index
    trail_info = TrailsSearch.new.find_trails(params[:location])
    render json: TripPlannerSerializer.new(trail_info)

  end

end
