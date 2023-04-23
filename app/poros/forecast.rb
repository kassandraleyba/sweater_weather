class Forecast
  attr_reader :id, :type, :attributes

  def initialize(data)
    @id = nil
    @type = 'forecast'
    @attributes = {
      current_weather: current_weather(data[:current]),
      daily_weather: five_day_weather(data),
      hourly_weather: hourly_weather(data)
    }
  end

  def current_weather(data)
    current_weather = {
      :last_update => data[:last_updated],
      :temp_f => data[:temp_f],
      :feelslike_f => data[:feelslike_f],
      :humidity => data[:humidity],
      :uv => data[:uv],
      :visibility => data[:vis_miles],
      :condition => {
        :text => data[:condition][:text],
        :icon => data[:condition][:icon]
      }
    }
  end

  def five_day_weather(data)
    five_day_weather = data[:forecast][:forecastday].map do |day| {
      :date => day[:date],
      :sunrise => day[:astro][:sunrise],
      :sunset => day[:astro][:sunset],
      :max_temp => day[:day][:maxtemp_f],
      :min_temp => day[:day][:mintemp_f],
      :condition => {
        :text => day[:day][:condition][:text],
        :icon => day[:day][:condition][:icon]
      }
    }
    end
    five_day_weather
    # binding.pry
  end

  def hourly_weather(data)
    hourly_weather = data[:forecast][:forecastday][0][:hour].map do |hour| {
      :time => hour[:time],
      :temp_f => hour[:temp_f],
      :condition => {
        :text => hour[:condition][:text],
        :icon => hour[:condition][:icon]
      }
    }
    end
    hourly_weather
    # binding.pry
  end
end