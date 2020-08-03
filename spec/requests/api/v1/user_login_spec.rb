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

  it "returns 400 erros if password is bad" do
  user = User.create({
    email: "whatever@example.com",
    password: "pasdsfsdfsword",
    api_key: "1234"
    })

    login_body = {
    "email": "whatever@example.com",
    "password": "passdsdsdfword"
    }

    headers = { "CONTENT_TYPE" => "application/json" }

    post '/api/v1/sessions', params: login_body.to_json, :headers => headers
    parsed_body = JSON.parse(response.body)
  
    expect(status).to eq(400)
    expect(parsed_body['body']).to eq("Sorry, your credentials are bad.")

  end

  it "returns 400 erros if email is bad" do
  user = User.create({
    email: "whatesdfsdver@example.com",
    password: "password",
    api_key: "1234"
    })

    login_body = {
    "email": "whatever@example.com",
    "password": "passdsdsdfword"
    }

    headers = { "CONTENT_TYPE" => "application/json" }

    post '/api/v1/sessions', params: login_body.to_json, :headers => headers
    parsed_body = JSON.parse(response.body)
    expect(status).to eq(400)
    expect(parsed_body['body']).to eq("Sorry, your credentials are bad.")
  end
end
