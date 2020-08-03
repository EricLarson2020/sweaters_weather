require 'rails_helper'

describe "hiking project endpoint" do
  it "shows data for hiking trails if given coords" do
    lat = '40.027'
    lon = '-105.2519'

    trails =  HikingProjectService.new.find_trails(lat, lon)

    expect(trails[:trails].first).to have_key(:name)
    expect(trails[:trails].first).to have_key(:summary)
    expect(trails[:trails].first).to have_key(:difficulty)
    expect(trails[:trails].first).to have_key(:location)

  end
end
