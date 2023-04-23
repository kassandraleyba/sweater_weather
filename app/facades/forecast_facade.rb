class ForecastFacade
  def find_forecast(lat, long)
    forecast_data = WeatherService.new.find_5_day_forecast(lat, long)
    Weather.new(forecast_data)
  end
end