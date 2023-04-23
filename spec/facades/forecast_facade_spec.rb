require 'rails_helper'

RSpec.describe ForecastFacade do
  it "can get a 5 day forecast object" do
    location = "denver,co"
  
    forecast = ForecastFacade.new.find_forecast(location)
  
    expect(forecast).to be_a(Forecast)
  end
end