require "rails_helper"

describe "background image endpoint" do
  it "displays a background image for a given location" do
    location_params = {location: 'denver,co'}
    get '/api/v1/backgrounds', params: location_params

    expect(response).to be_successful

    image = JSON.parse(response.body, symbolize_names: true)

    expect(image[:data][:attributes]).to have_key(:location)
    expect(image[:data][:attributes]).to have_key(:url)
  end
end
