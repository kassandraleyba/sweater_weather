class SalaryFacade
  def find_salary(location)
    # want to return to the user salary and weather

    map_data = MapquestService.new.find_lat_long(location) #returns hash with location = denver,co to find lat and long
    lat = map_data[:results][0][:locations][0][:latLng][:lat] # find lat in nested hash
    long = map_data[:results][0][:locations][0][:latLng][:lng] # find long in nested hash
    forecast_data = WeatherService.new.find_5_day_forecast(lat, long) # returns hash with 5 day forecast (includes current weather) 
    salary_data = TeleportService.new.find_urban_area_salaries(location)
    
    # need to filter through jobs and iterate through salaries
    titles = []
    desired_titles = ["Data Analyst", "Data Scientist", "QA Engineer", "Mobile Developer", "Software Engineer", "Systems Administrator", "Web Developer"]
    salaries = salary_data[:salaries].each do |salary|
        if desired_titles.include?(salary[:job][:title])
         titles << {
            title: salary[:job][:title],
            min: "$#{salary[:salary_percentiles][:percentile_25].round(2)}",
            max: "$#{salary[:salary_percentiles][:percentile_25].round(2)}"
          }
        end
    end

    forecast = {
      text: forecast_data[:current][:condition][:text]
      temp_f: forecast_data[:current][:temp_f]
    }

    Salary.new(salaries, forecast)
    #text and temp_f
  end
end
