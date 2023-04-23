class ForecastFacade
  def find_forecast(location)
    map_data = MapquestService.new.find_lat_long(location)
    lat = map_data[:results][0][:locations][0][:latLng][:lat]
    long = map_data[:results][0][:locations][0][:latLng][:lng]
    forecast_data = WeatherService.new.find_5_day_forecast(lat, long)

    current_weather = {
      last_updated: forecast_data[:current][:last_updated],
      temp_f: forecast_data[:current][:temp_f],
      feelslike_f: forecast_data[:current][:feelslike_f],
      humidity: forecast_data[:current][:humidity],
      uv: forecast_data[:current][:uv],
      visibility: forecast_data[:current][:vis_miles],
      text: forecast_data[:current][:condition][:text],
      icon: forecast_data[:current][:condition][:icon]
    }
    
    five_day_weather = forecast_data[:forecast][:forecastday].map do |day|
      {
        date: day[:date],
        sunrise: day[:astro][:sunrise],
        sunset: day[:astro][:sunset],
        max_temp: day[:day][:maxtemp_f],
        min_temp: day[:day][:mintemp_f],
        condition: {
          text: day[:day][:condition][:text],
          icon: day[:day][:condition][:icon]
        }
      }
    end

    hourly_weather = forecast_data[:forecast][:forecastday][0][:hour].map do |hour|
      {
        time: hour[:time],
        temp_f: hour[:temp_f],
        condition: {
          text: hour[:condition][:text],
          icon: hour[:condition][:icon]
        }
      }
    end

    Forecast.new(current_weather, five_day_weather, hourly_weather)
    # binding.pry
  end
end
