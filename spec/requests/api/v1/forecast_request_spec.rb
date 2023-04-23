require 'rails_helper'

RSpec.describe 'Forecast API' do
  it "can get a forecast for a city" do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data).to be_a(Hash)
  end
end