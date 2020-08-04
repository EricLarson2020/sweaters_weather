class Api::V1::RoadTripController < ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      search = RoadTripSearch.new.get_road_trip_information(params[:origin], params[:destination])
      render json: TripPlannerSerializer.new(search)
    else
      render json: {body: "Sorry, your credentials are bad."}, status: 401
    end
  end

end
