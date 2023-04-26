require 'rails_helper'

RSpec.describe ForecastFacade do
  describe "happy path for facade object" do
    it "can get a 5 day forecast object" do
      VCR.use_cassette('forecast_facade_denver_co') do
        location = "denver,co"
      
        forecast = ForecastFacade.new.find_forecast(location)
      
        expect(forecast).to be_a(Forecast)
        expect(forecast.current_weather).to have_key(:last_updated)
        expect(forecast.current_weather).to have_key(:temp_f)
        expect(forecast.current_weather).to have_key(:feelslike_f)
    
        expect(forecast.five_day_weather[0]).to have_key(:date)
        expect(forecast.five_day_weather[0]).to have_key(:sunrise)
        expect(forecast.five_day_weather[0]).to have_key(:sunset)
    
        expect(forecast.hourly_weather[0]).to have_key(:time)
        expect(forecast.hourly_weather[0]).to have_key(:temp_f)
        expect(forecast.hourly_weather[0]).to have_key(:condition)
      end
    end
  end

  describe "sad path for facade object" do
    it "sad path for facade object" do
      VCR.use_cassette('sad_forecast_facade_denver_co') do
  

        location = "denver,co"
      
        forecast = ForecastFacade.new.find_forecast(location)
    
        expect(forecast.current_weather).to_not have_key(:temp_c)
        expect(forecast.current_weather).to_not have_key(:feelslike_c)
    
        expect(forecast.five_day_weather[0]).to_not have_key(:avgtemp_c)
        expect(forecast.five_day_weather[0]).to_not have_key(:maxtemp_c)
        expect(forecast.five_day_weather[0]).to_not have_key(:mintemp_c)
    
        expect(forecast.hourly_weather[0]).to_not have_key(:vis_km)
        expect(forecast.hourly_weather[0]).to_not have_key(:temp_c)
        expect(forecast.hourly_weather[0]).to_not have_key(:windchill_c)
      end
    end
  end
end