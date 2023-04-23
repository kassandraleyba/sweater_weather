require 'rails_helper'

RSpec.describe Weather do
  it "exists" do
    data = {
      :current => {
        :last_updated => "2021-03-02 14:00",
        :temp_f => 34.3,
        :feelslike_f => 31.8,
        :humidity => 67,
        :uv => 3.0,
        :visibility => 9.0,
        :condition => {
          :text => "Partly cloudy",
          :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
        }
      },
      :forecast => {
        :forecastday => [{
          :date => "2021-03-02 14:00",
          :astro => {
            :sunrise => "2021-03-02 14:00",
            :sunset => "2021-03-02 14:00"
          },
          :day => {
            :maxtemp_f => 34.3,
            :mintemp_f => 31.8,
            :condition => {
              :text => "Partly cloudy",
              :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
            }
          },
          :hour => [{
            :time => "2021-03-02 14:00",
            :temp_f => 34.3,
            :condition => {
              :text => "Partly cloudy",
              :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
            }
          }]
        }]
      }
    }

    weather = Weather.new(data)
 
    #current weather
    expect(weather).to be_a(Weather)
    expect(weather.last_updated).to eq("2021-03-02 14:00")
    expect(weather.temp_in_f).to eq(34.3)
    expect(weather.feels_like_in_f).to eq(31.8)
    expect(weather.humidity).to eq(67)
    expect(weather.uvi).to eq(3.0)
    # expect(weather.visibility_in_miles).to eq(9.0)
    expect(weather.condition_current).to eq("Partly cloudy")
    expect(weather.icon_current).to eq("//cdn.weatherapi.com/weather/64x64/day/116.png")
    # 5 day forecast
    expect(weather.date).to eq("2021-03-02 14:00")
    expect(weather.sunrise).to eq("2021-03-02 14:00")
    expect(weather.sunset).to eq("2021-03-02 14:00")
    expect(weather.max_temp).to eq(34.3)
    expect(weather.min_temp).to eq(31.8)
    expect(weather.condition_forecast).to eq("Partly cloudy")
    expect(weather.icon_forecast).to eq("//cdn.weatherapi.com/weather/64x64/day/116.png")
    # hourly forecast
    # expect(weather.time).to eq("2021-03-02 14:00")
    expect(weather.temp_in_f).to eq(34.3)
    expect(weather.condition_hourly).to eq("Partly cloudy")
    expect(weather.icon_hourly).to eq("//cdn.weatherapi.com/weather/64x64/day/116.png")
  end
end