class ForecastFacade
  def find_forecast(location)
    data = MapquestService.new.find_lat_long(location)
    lat = data[:results][0][:locations][0][:latLng][:lat]
    long = data[:results][0][:locations][0][:latLng][:lng]
    forecast_data = WeatherService.new.find_5_day_forecast(lat, long)
    Forecast.new(forecast_data) 
    # binding.pry
  end
end