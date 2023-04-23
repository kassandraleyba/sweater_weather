class Weather
  attr_reader :last_updated,
              :temp_in_f,
              :feels_like_in_f,
              :humidity,
              :uvi,
              :visibility_in_miles,
              :condition_current,
              :icon_current,
              :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :condition_forecast,
              :icon_forecast,
              :time,
              :condition_hourly,
              :icon_hourly

  def initialize(data)
    #current weather
    @last_updated = data[:current][:last_updated]
    @temp_in_f = data[:current][:temp_f]
    @feels_like_in_f = data[:current][:feelslike_f]
    @humidity = data[:current][:humidity] #int or float
    @uvi = data[:current][:uv] #int or float #return as uvi in serializer
    @visibility_in_miles = data[:current][:vis_miles] #int or float #visibility in serializer
    @condition_current = data[:current][:condition][:text] #text description
    @icon_current = data[:current][:condition][:icon] #url
    #5 day forecast
    @date = data[:forecast][:forecastday][0][:date]
    @sunrise = data[:forecast][:forecastday][0][:astro][:sunrise]
    @sunset = data[:forecast][:forecastday][0][:astro][:sunset]
    @max_temp = data[:forecast][:forecastday][0][:day][:maxtemp_f]
    @min_temp = data[:forecast][:forecastday][0][:day][:mintemp_f]
    @condition_forecast = data[:forecast][:forecastday][0][:day][:condition][:text]
    @icon_forecast = data[:forecast][:forecastday][0][:day][:condition][:icon]
    #hourly forecast
    @time = data[:forecast][:forecastday][0][:hour][0][:time]
    @temp_in_f = data[:forecast][:forecastday][0][:hour][0][:temp_f]
    @condition_hourly = data[:forecast][:forecastday][0][:hour][0][:condition][:text]
    @icon_hourly = data[:forecast][:forecastday][0][:hour][0][:condition][:icon]
  end
end