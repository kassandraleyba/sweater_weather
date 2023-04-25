require 'rails_helper'

RSpec.describe 'Roadtrip API' do
  it "can have a travel time between locations" do
    get '/api/v1/road_trip?origin=denver,co&destination=pueblo,co'

    expect(response).to be_successful

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data[:data]).to be_a(Hash)
    expect(parsed_data[:data][:id]).to eq("null")
    expect(parsed_data[:data][:type]).to eq("roadtrip")
    expect(parsed_data[:data][:attributes]).to be_a(Hash)
    expect(parsed_data[:data][:attributes][:start_city]).to eq("Denver, CO")
    expect(parsed_data[:data][:attributes][:end_city]).to eq("Pueblo, CO")
    expect(parsed_data[:data][:attributes][:travel_time]).to eq("1 hour 48 mins")
    expect(parsed_data[:data][:attributes][:weather_at_eta]).to be_a(Hash)
    expect(parsed_data[:data][:attributes][:weather_at_eta].keys).to eq([:datetime, :temperature, :conditions])
  end
end