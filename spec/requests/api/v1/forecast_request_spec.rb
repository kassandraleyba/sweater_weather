require 'rails_helper'

RSpec.describe 'Forecast API' do
  it "can get a forecast for a city" do
    # create_list(:location, 1)

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(parsed_data[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(parsed_data[:data][:attributes][:current_weather]).to have_key(:sunset)
  end
end