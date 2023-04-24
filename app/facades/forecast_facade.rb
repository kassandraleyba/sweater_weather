class ForecastFacade
  def find_forecast(location)
    map_data = MapquestService.new.find_lat_long(location) #returns hash with location = denver,co to find lat and long
    lat = map_data[:results][0][:locations][0][:latLng][:lat] # find lat in nested hash
    long = map_data[:results][0][:locations][0][:latLng][:lng] # find long in nested hash
    forecast_data = WeatherService.new.find_5_day_forecast(lat, long) # returns hash with 5 day forecast (includes current weather) 
    city = map_data[:results][0][:locations][0][:adminArea5]
    # binding.pry
    salary_data = TeleportService.new.find_urban_area_salaries(city)
    # parsing error - getting data in service

    # salary_data = TeleportService.new.find_salaries_by_destination(city)

    # don't need to iterate through since this is 1 day worth of data
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
    
    # need to iterate through to get the 5 day forecast
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

    # need to iterate through to get the hourly forecast
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

    # new instance of Forecast object (from poro), passing in the 3 variables above
    # initially tried setting this up in the poro
    # but couldn't figure out how to get it to work correctly
    Forecast.new(current_weather, five_day_weather, hourly_weather)

    # need to filter through jobs and iterate through salaries
    # binding.pry
    salaries = salary_data.map do |salary|
      {
        title: salary[:job][:title],
        min: salary[:salary_percentiles][:percentile_25].round(2),
        max: salary[:salary_percentiles][:percentile_25].round(2)
      }
    end
    Salary.new(salaries)
  end
end
