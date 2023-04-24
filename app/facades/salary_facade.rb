class SalaryFacade
  def find_salary(location)
    map_data = MapquestService.new.find_lat_long(location) #returns hash with location = denver,co to find lat and long
    lat = map_data[:results][0][:locations][0][:latLng][:lat] # find lat in nested hash
    long = map_data[:results][0][:locations][0][:latLng][:lng] # find long in nested hash
    forecast_data = WeatherService.new.find_5_day_forecast(lat, long) # returns hash with 5 day forecast (includes current weather) 
    city = map_data[:results][0][:locations][0][:adminArea5]
    salary_data = TeleportService.new.find_urban_area_salaries(city)
    binding.pry
    # parsing error - getting data in service

    # salary_data = TeleportService.new.find_salaries_by_destination(city)

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
