require "rails_helper"

describe "trip endpoint" do
  it "gives travel time and forecast for a trip" do
    user = User.create({
      email: "bob@email.com",
      password: "password",
      api_key: 'jgn983hy48thw9begh98h4539h4'
      })

    json_body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "jgn983hy48thw9begh98h4539h4"
      }

    headers = { "CONTENT_TYPE" => "application/json" }

    post '/api/v1/road_trip', params: json_body.to_json, headers: headers

    expect(response).to be_successful
    binding.pry

  end
end
