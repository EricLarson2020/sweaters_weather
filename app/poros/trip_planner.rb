class TripPlanner
  attr_reader :to, :from, :temperature, :description, :travel_time, :id
  def initialize(to, from, forecast, travel_time)
    @to = to
    @from = from
    @temperature =  forecast.current[:temp]
    @description =  forecast.current[:weather].first[:description]
    @travel_time = travel_time[:route][:formattedTime]
    @id = nil
  end
end
