require "rails_helper"

describe "weather api" do
  it "sends out forecast for location" do

  get '/api/v1/forecast', params: {location: 'denver,co'}
  binding.pry
  expect(response).to be_successful

   coords = JSON.parse(response.body)
 end
end
