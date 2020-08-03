require 'rails_helper'

describe "User registration" do
  it "can register" do
    body= {
      'email': 'email@email.com',
      'password': 'password',
      'password_confirmation': 'password'
    }
    headers = { "CONTENT_TYPE" => "application/json" }

    post '/api/v1/users', params: body.to_json, :headers => headers

    expect(response).to be_successful
    registration_response = JSON.parse(response.body, symbolize_names:true)
    binding.pry
    expect(response.status).to eq(201)
    expect(registration_response[:data][:attributes]).to have_key(:email)
    expect(registration_response[:data][:attributes]).to have_key(:api_key)
  end

  # it "recieves 400 error if passwords dont match" do
  #   registration_params = {
  #     'email': 'email@email.com',
  #     'password': 'password',
  #     'password_confirmation': 'pasdworddsd'
  #   }
  #     post '/api/v1/users', params: registration_params
  #
  #     expect(response.status).to eq(400)
  # end
  #
  # it "recieves 400 error if email is not unique" do
  #   User.create({
  #     email: 'email@email.com',
  #     password_digest: "password",
  #     api_key: "1234",
  #     })
  #
  #   registration_params = {
  #     'email': 'email@email.com',
  #     'password': 'password',
  #     'password_confirmation': 'pasdworddsd'
  #   }
  #     post '/api/v1/users', params: registration_params
  #
  #     expect(response.status).to eq(400)
  # end
end
