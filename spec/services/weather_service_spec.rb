require 'rails_helper'

RSpec.describe WeatherService do
  context "instance methods" do
    it "can find the 5 day forecast in Denver" do
      VCR.use_cassette('weather_service_5_day_forecast_denver_co') do
        forecast = WeatherService.new.find_5_day_forecast("39.738453", "-104.984853")
     
        expect(forecast).to be_a(Hash)
      end
    end
  end
end