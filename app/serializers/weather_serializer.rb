class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :datetime, :current_temp, :feels_like, :high, :humidity, :low, :sunrise, :sunset, :visibility, :weather_description, :weather_icon, :weather_main, :daily, :hourly
end
