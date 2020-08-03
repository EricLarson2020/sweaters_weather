require 'rails_helper'

describe "directions endpoint" do
  it "can get mapquest directions" do
    to = "Granby, Colorado"
    from = "denver,co"

    distance = MapQuestService.new.get_distance(to, from)
    binding.pry
    expect(distance[:route]).to have_key(:distance)


  end
end
