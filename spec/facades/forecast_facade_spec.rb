require 'rails_helper'

RSpec.describe ForecastFacade do
  xit "can get a 5 day forecast object" do
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

  xit "sad path for facade object" do
    location = "denver,co"
  
    forecast = ForecastFacade.new.find_forecast(location)

    expect(forecast).to be_a(Forecast)
    expect(forecast.current_weather).to_not have_key(:temp_c)
    expect(forecast.current_weather).to_not have_key(:feelslike_c)

    expect(forecast.five_day_weather[0]).to_not have_key(:avgtemp_c)
    expect(forecast.five_day_weather[0]).to_not have_key(:maxtemp_c)
    expect(forecast.five_day_weather[0]).to_not have_key(:mintemp_c)

    expect(forecast.hourly_weather[0]).to_not have_key(:vis_km)
    expect(forecast.hourly_weather[0]).to_not have_key(:temp_c)
    expect(forecast.hourly_weather[0]).to_not have_key(:windchill_c)
  end

  it "can get salaries for a location" do
    location = "chicago,il"
  
    salaries = ForecastFacade.new.find_urban_area_salaries(location)

    expect(salaries).to be_a(Salary)
  end
end