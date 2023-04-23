require 'rails_helper'

RSpec.describe Forecast do
  it "exists" do
    current_weather = {
        :last_updated => "2021-03-02 14:00",
        :temp_f => 34.3,
        :feelslike_f => 31.8,
        :humidity => 67,
        :uv => 3.0,
        :visibility => 9.0,
        :text => "Partly cloudy",
        :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
      }

    five_day_weather = [
        {
          :date => "2021-03-02 14:00",
          :sunrise => "2021-03-02 14:00",
          :sunset => "2021-03-02 14:00",
          :maxtemp_f => 34.3,
          :mintemp_f => 31.8,
          :text => "Partly cloudy",
          :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
        },
        {
          :date => "2021-03-03 14:00",
          :sunrise => "2021-03-03 14:00",
          :sunset => "2021-03-03 14:00",
          :maxtemp_f => 34.3,
          :mintemp_f => 31.8,
          :text => "Partly cloudy",
          :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
        },
        {
          :date => "2021-03-04 14:00",
          :sunrise => "2021-03-04 14:00",
          :sunset => "2021-03-04 14:00",
          :maxtemp_f => 34.3,
          :mintemp_f => 31.8,
          :text => "Partly cloudy",
          :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
        },
        {
          :date => "2021-03-05 14:00",
          :sunrise => "2021-03-05 14:00",
          :sunset => "2021-03-05 14:00",
          :maxtemp_f => 34.3,
          :mintemp_f => 31.8,
          :text => "Partly cloudy",
          :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
        },
        {
          :date => "2021-03-06 14:00",
          :sunrise => "2021-03-06 14:00",
          :sunset => "2021-03-06 14:00",
          :maxtemp_f => 34.3,
          :mintemp_f => 31.8,
          :text => "Partly cloudy",
          :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
        }
    ]

    hourly_weather = [
      {
        :time => "2021-03-02 14:00",
        :temp_f => 34.3,
        :condition => {
          :text => "Partly cloudy",
          :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
        }
      },
      {
        :time => "2021-03-02 15:00",
        :temp_f => 34.3,
        :condition => {
          :text => "Partly cloudy",
          :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
        }
      },
      {
        :time => "2021-03-02 16:00",
        :temp_f => 34.3,
        :condition => {
          :text => "Partly cloudy",
          :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
        }
      },
      {
          :time => "2021-03-02 17:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-02 18:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-02 19:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-02 20:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-02 21:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-02 22:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-02 23:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-02 00:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-03 01:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-03 02:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-03 03:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-03 04:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-03 04:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-03 05:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-03 06:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-03 07:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-03 08:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-03 09:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-03 10:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-03 11:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        },
        {
          :time => "2021-03-03 12:00",
          :temp_f => 34.3,
          :condition => {
            :text => "Partly cloudy",
            :icon => "//cdn.weatherapi.com/weather/64x64/day/116.png"
          }
        }
      ]
  
    forecast = Forecast.new(current_weather, five_day_weather, hourly_weather)
  
    expect(forecast).to be_a(Forecast)
    expect(forecast.id).to eq('null')
    expect(forecast.type).to eq('forecast')
    expect(forecast.current_weather).to eq(current_weather)
    expect(forecast.five_day_weather).to eq(five_day_weather)
    expect(forecast.hourly_weather).to eq(hourly_weather)
  end
end