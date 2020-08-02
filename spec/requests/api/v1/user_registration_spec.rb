require 'rails_helper'

describe "User registration" do
  it "can register" do
    registration_params = {
      'email': 'email@email.com',
      'password': 'password',
      'password_confirmation': 'password'
    }

    post '/api/v1/users', params: registration_params

    expect(response).to be_successful
    registration_response = JSON.parse(response.body, symbolize_names:true)
    expect(registration_response[:status]).to eq('201')
    expect(registration_response[:data][:attributes]).to have_key(:email)
    expect(registration_response[:data][:attributes]).to have_key(:api_key)
  end
end
