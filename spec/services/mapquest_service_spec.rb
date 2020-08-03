require 'rails_helper'

describe "map quest service" do
  it "returns latitude and longitude from location" do
    service = MapquestService.new
    coords = service.get_coords('denver,co')


    expect(coords).to be_a Hash

    expect(coords[:results].first[:locations].first[:latLng].keys).to eq([:lat, :lng])
  end

  it "can get mapquest directions" do
    to = "Granby, Colorado"
    from = "denver,co"

    distance = MapquestService.new.get_distance(to, from)

    expect(distance[:route]).to have_key(:distance)


  end

end
