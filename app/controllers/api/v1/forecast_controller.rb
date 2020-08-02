class Api::V1::ForecastController < ApplicationController

  def index

    map_search = MapquestSearch.new
    map_search_result = map_search.find_coords(params[:location])
    weather_search = OpenWeatherSearch.new
    weather_result = weather_search.get_weather(map_search_result.lat, map_search_result.lon)

    render json: WeatherSerializer.new(weather_result)
  end


end
