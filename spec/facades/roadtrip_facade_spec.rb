require 'rails_helper'

RSpec.describe RoadtripFacade do
  it "can have a object" do
    roadtrip = RoadtripFacade.new.find_roadtrip_info("Denver,CO", "Boulder,CO")

    expect(roadtrip).to be_a(Roadtrip)
  end
end