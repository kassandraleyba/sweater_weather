require 'rails_helper'

RSpec.describe MapquestService do
  context "instance methods" do
    it "can find lat and long through location" do
      location = MapquestService.new.find_lat_long("denver,co")
      #latLng=>{:lat=>39.74001, :lng=>-104.99202}
      expect(location).to be_a(Hash)
    end
  end
end