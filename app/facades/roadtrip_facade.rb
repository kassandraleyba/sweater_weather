class RoadtripFacade
  def find_roadtrip_info(origin, destination)
    # binding.pry
    map_data = MapquestService.new.find_lat_long(location) #returns hash with location = denver,co to find lat and long
    lat = map_data[:results][0][:locations][0][:latLng][:lat] # find lat in nested hash
    long = map_data[:results][0][:locations][0][:latLng][:lng] # find long in nested hash
    forecast_data = WeatherService.new.find_5_day_forecast(lat, long) # returns hash with 5 day forecast (includes current weather)

    travel_time = MapquestService.new.find_travel_time(origin, destination)
    # binding.pry
    Roadtrip.new
  end
end