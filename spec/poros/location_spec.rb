require 'rails_helper'

RSpec.describe Location do
  it "exists" do
    data = {
      :results => [{
        :locations => [{
          :adminArea5 => "Denver",
          :adminArea3 => "CO",
          :latLng => {:lat=>39.74001, :lng=>-104.99202}
        }]
      }]
    }
    location = Location.new(data)
   
    expect(location).to be_a(Location)
    # expect(location.city).to eq("Denver")
    # expect(location.state).to eq("CO")
    expect(location.lat).to eq(39.74001)
    expect(location.long).to eq(-104.99202)
  end
end