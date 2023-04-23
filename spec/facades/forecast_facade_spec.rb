require 'rails_helper'

RSpec.describe ForecastFacade do
  it "can get a forecast object" do
    lat = "39.74," 
    long = "-104.98"
    weather = ForecastFacade.new.find_forecast(lat, long)

    expect(weather).to be_a(Weather)
  end
end