require "rails_helper"

describe "weather api" do
  it "sends out forecast for location" do

  get '/api/v1/forecast', params: {location: 'denver,co'}

  expect(response).to be_successful

   coords = JSON.parse(response.body, symbolize_names: true)
   
   expect(coords[:data][:attributes]).to have_key(:location)
   expect(coords[:data][:attributes]).to have_key(:current)
   expect(coords[:data][:attributes]).to have_key(:daily)
   expect(coords[:data][:attributes]).to have_key(:hourly)
 end
end
