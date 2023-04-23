require 'rails_helper'

RSpec.describe Forecast do
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
  
    # forecast = Forecast.new(data)

    # expect(forecast).to be_a(Forecast)
  end
end