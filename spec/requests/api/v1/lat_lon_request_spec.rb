require "rails_helper"

describe "weather api" do
  it "sends out forecast for location" do

  get '/api/v1/forecast', params: {location: 'denver,co'}

  expect(response).to be_successful

   coords = JSON.parse(response.body)
   binding.pry
 end
end
