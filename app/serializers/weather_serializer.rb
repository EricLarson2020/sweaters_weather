class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :current, :location, :hourly, :daily
end
