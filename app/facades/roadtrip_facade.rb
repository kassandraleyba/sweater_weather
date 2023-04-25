class RoadtripFacade
  def find_roadtrip_info(origin, destination)
    map_data = MapquestService.new.find_lat_long(origin) #returns hash with location = denver,co to find lat and long
    lat = map_data[:results][0][:locations][0][:latLng][:lat] # find lat in nested hash
    long = map_data[:results][0][:locations][0][:latLng][:lng] # find long in nested hash
    forecast_data = WeatherService.new.find_5_day_forecast(lat, long) # returns hash with 5 day forecast (includes current weather)
    travel_data = MapquestService.new.find_travel_time(origin, destination)
 
    start_city = origin
    end_city = destination

    travel_time = {
      #2 hours, 13 minutes OR impossible route
      travel_time: travel_data[:route][:formattedTime]
    }

    if travel_time[:travel_time].present?
      hours, minutes, seconds = travel_time[:travel_time].split(':').map(&:to_i) # 0, 34, 15 = [0, 34, 15]
      total_seconds = hours * 3600 + minutes * 60 + seconds # 2055
      formatted_travel_time = Time.at(total_seconds).utc.strftime("%-H hours, %-M minutes") # "0 hours, 34 minutes"
  
      arrival_time = Time.now + total_seconds # 2023-04-25 11:43:04.428557 -0600
  
      temperature = forecast_data[:forecast][:forecastday][0][:hour][0][:temp_c] # 9.9
      condition = forecast_data[:forecast][:forecastday][0][:hour][0][:condition][:text] # "Partly cloudy"
  
      weather_at_eta = {
        datetime: arrival_time.strftime('%Y-%m-%d %H:%M:%S'),
        temperature: temperature,
        condition: condition
      }
    else
      if travel_time[:info].present? && travel_time[:info][:statuscode] == 0
     
        return { error: "Unable to find travel time" }, status: 400
      end
    end
    
    # {:datetime=>"2023-04-25 11:43:04", :temperature=>9.9, :condition=>"Partly cloudy"}
  
    Roadtrip.new(start_city, end_city, formatted_travel_time, weather_at_eta)
  end
end