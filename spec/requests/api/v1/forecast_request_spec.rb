require 'rails_helper'

RSpec.describe 'Forecast API' do
  it "can get a forecast for a city" do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data[:data]).to be_a(Hash)
    expect(parsed_data[:data][:id]).to eq("null")
    expect(parsed_data[:data][:type]).to eq("forecast")
    expect(parsed_data[:data][:attributes]).to be_a(Hash)
    expect(parsed_data[:data][:attributes][:current_weather].keys).to eq([:last_updated, :temp_f, :feelslike_f, :humidity, :uv, :visibility, :text, :icon])
    expect(parsed_data[:data][:attributes][:five_day_weather].first.keys).to eq([:date, :sunrise, :sunset, :max_temp, :min_temp, :condition])
    expect(parsed_data[:data][:attributes][:hourly_weather].first.keys).to eq([:time, :temp_f, :condition])
  end
end