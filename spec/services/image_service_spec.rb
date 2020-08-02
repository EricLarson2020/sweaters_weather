require "rails_helper"

describe "Unsplash Image Service" do
  it "return image from location param" do
    location = 'denver'
    service = ImageService.new
    image = service.find_image(location)

    expect(image).to be_a(Hash)
    expect(image[:results].first[:urls]).to have_key(:full)
  end

end
