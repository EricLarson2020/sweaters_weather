require 'rails_helper'

describe "user login" do
  it "the user can login" do
    user = User.create({
      email: "whatever@example.com",
      password: "password",
      api_key: "1234"
      })

  login_body = {
  "email": "whatever@example.com",
  "password": "password"
  }

  headers = { "CONTENT_TYPE" => "application/json" }

    post '/api/v1/sessions', params: login_body.to_json, :headers => headers



    response = JSON.parse(body, symbolize_names: true)
    expect(response[:data][:attributes]).to have_key(:email)
    expect(response[:data][:attributes]).to have_key(:api_key)

  end
end
