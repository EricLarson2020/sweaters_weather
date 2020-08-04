require 'rails_helper'

describe "map quest service" do
  it "returns latitude and longitude from location" do
    service = MapquestService.new
    coords = service.get_coords('denver,co')


    expect(coords).to be_a Hash

    expect(coords[:results].first[:locations].first[:latLng].keys).to eq([:lat, :lng])
  end

  it "returns travel time between locations" do

    origin = "Denver,CO",
    destination = "Pueblo,CO"

    service = MapquestService.new
    time = service.get_travel_time(destination, origin)

    expect(time).to be_a Hash
    expect(time[:route]).to have_key(:formattedTime)
  end
end
