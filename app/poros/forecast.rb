class Forecast
  attr_reader :id, 
              :type,  
              :current_weather, 
              :five_day_weather,
              :hourly_weather

  def initialize(id = "null", type = "forecast", current_weather, five_day_weather, hourly_weather)
    @id = id
    @type = type
    @current_weather = current_weather
    @five_day_weather = five_day_weather
    @hourly_weather = hourly_weather
  end
end