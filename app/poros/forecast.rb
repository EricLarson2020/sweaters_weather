class Forecast
  attr_reader :sunrise,
              :temp,
              :sunset,
              :sunrise,
              :feels_like,
              :humidity,
              :visibility,
              :weather_main,
              :weather_description,
              :weather_icon,
              :current_temp,
              :high,
              :low,
              :datetime,
              :hourly,
              :daily,
              :id

  def initialize(data)
    @datetime = data[:current][:dt]
    @sunrise = data[:current][:sunrise]
    @sunset = data[:current][:sunset]
    @current_temp = data[:current][:temp]
    @feels_like = data[:current][:feels_like]
    @humidity = data[:current][:humidity]
    @visibility = data[:current][:visibility]
    @weather_main =  data[:current][:weather].first[:main]
    @weather_description = data[:current][:weather].first[:description]
    @weather_icon = data[:current][:weather].first[:icon]
    @high = data[:daily].first[:temp][:max]
    @low =  data[:daily].first[:temp][:min]
    @hourly = hourly_weather(data)
    @daily = daily_weather(data)
    @id = nil
  end

    

    def hourly_weather(data)

      array = []
      data[:hourly].each do |data|
        hash = {}
        hash[:time] = data[:dt]
        hash[:icon] = data[:weather].first[:icon]
        hash[:temp] = data[:temp]
        array << hash
      end
      array
    end

    def daily_weather(data)
      array = []
      data[:daily].map do |data|
        hash = {}
        hash[:day] = data[:dt]
        hash[:icon] = data[:weather].first[:icon]
        hash[:weather_description] = data[:weather].first[:description]
        hash[:rain] = data[:rain]
        hash[:high] = data[:temp][:max]
        hash[:low] = data[:temp][:min]
        array << hash
      end
      array
    end

end
