require 'rails_helper'

describe 'trails endpoint' do
  it 'get information for trials in area' do

    get '/api/v1/trails', params: {location: 'denver,co'}

    expect(response).to be_successful

    trails = JSON.parse(response.body, symbolize_names: true)
    
    expect(trails[:data][:attributes][:location]).to eq('denver,co')

    expect(trails[:data][:attributes][:forecast]).to have_key(:summary)
    expect(trails[:data][:attributes][:forecast]).to have_key(:temperature)

    expect(trails[:data][:attributes][:trails].first).to have_key(:name)
    expect(trails[:data][:attributes][:trails].first).to have_key(:summary)
    expect(trails[:data][:attributes][:trails].first).to have_key(:difficulty)
    expect(trails[:data][:attributes][:trails].first).to have_key(:location)
    expect(trails[:data][:attributes][:trails].first).to have_key(:distance_to_trail)

  end
end
