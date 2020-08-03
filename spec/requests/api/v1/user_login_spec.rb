require 'rails_helper'

describe "user login" do
  it "the user can login" do
  body = {
  "email": "whatever@example.com",
  "password": "password"
  }

  headers = { "CONTENT_TYPE" => "application/json" }

    post '/api/v1/sessions', params: body.to_json, :headers => headers

    expect(response).to be_successful

    response = JSON.parse(response.body, symbolize_names: true)
    expect(response[:data][:attributes]).to have_key(:email)
    expect(response[:data][:attributes]).to have_key(:api_key)

  end
end
