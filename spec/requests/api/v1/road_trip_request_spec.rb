require 'rails_helper'

RSpec.describe 'Roadtrip API' do
  it "can have a travel time between locations" do
    post '/api/v1/roadtrip?origin=denver,co&destination=pueblo,co'
  
    expect(response).to be_successful

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(parsed_data[:data]).to be_a(Hash)
    expect(parsed_data[:data][:id]).to eq("null")
    expect(parsed_data[:data][:type]).to eq("roadtrip")
    expect(parsed_data[:data][:attributes]).to be_a(Hash)
    expect(parsed_data[:data][:attributes][:start_city]).to eq("denver,co")
    expect(parsed_data[:data][:attributes][:end_city]).to eq("pueblo,co")
    expect(parsed_data[:data][:attributes][:travel_time]).to eq("1 hours, 43 minutes")
    expect(parsed_data[:data][:attributes][:weather_at_eta]).to be_a(Hash)
    expect(parsed_data[:data][:attributes][:weather_at_eta].keys).to eq([:datetime, :temperature, :condition])
  end

  it "cannot have a travel time between locations if the origin is missing" do
    post '/api/v1/roadtrip?origin=&destination=pueblo,co'

    expect(response.status).to eq(400)
  end

  it "cannot have a travel time between locations if the destination is missing" do
    post '/api/v1/roadtrip?origin=denver,co&destination='

    expect(response.status).to eq(400)
  end

  it "cannot have a travel time between locations if the destination is impossible" do
    # impossible
    post '/api/v1/roadtrip?origin=denver,co&destination=london,uk'

    expect(response.status).to eq(400)
  end

  it "cannot have a travel time between locations if the api key is missing or invalid" do
    post '/api/v1/roadtrip?origin=denver,co&destination=pueblo,co,api_key=invalid_key'

    expect(response.status).to eq(400)
  end
end