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

    trip_info = JSON.parse(response.body, symbolize_names: true)

    expect(trip_info[:data][:attributes]).to have_key(:to)
    expect(trip_info[:data][:attributes]).to have_key(:from)
    expect(trip_info[:data][:attributes]).to have_key(:temperature)
    expect(trip_info[:data][:attributes]).to have_key(:description)
    expect(trip_info[:data][:attributes]).to have_key(:travel_time)
  end

  it "gives 401 error if api_key does not match" do
    user = User.create({
      email: "bob@email.com",
      password: "password",
      api_key: 'jgn983hy48thw9begh98h4539h4'
      })

    json_body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "jgn983hysdfsdfsaa48thw9begh98h4539h4"
      }

    headers = { "CONTENT_TYPE" => "application/json" }

    post '/api/v1/road_trip', params: json_body.to_json, headers: headers

    expect(response.status).to eq(401)
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expect(parsed_response[:body]).to eq("Sorry, your credentials are bad.")
  end
end
