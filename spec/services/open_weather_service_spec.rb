require 'rails_helper'

describe "open weather service" do
  it "Displays weather for location" do
    lat = 39.738453
    lon = -104.984853
    service = OpenWeatherService.new
    weather = service.get_weather(lat, lon)

    expect(weather).to be_a Hash
    expect(weather[:current]).to have_key(:sunrise)
    expect(weather[:current]).to have_key(:temp)
    expect(weather[:current]).to have_key(:sunset)
    expect(weather[:current]).to have_key(:feels_like)
    expect(weather[:current]).to have_key(:humidity)
    expect(weather[:current]).to have_key(:visibility)
    expect(weather[:current]).to have_key(:weather)



  end
end

#Current_weather
#high, low, current_temp, weather_description, location, time, feels_like, humidity, visibility, UV_index, sunrise, sunset, icon.
