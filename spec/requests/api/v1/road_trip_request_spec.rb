require 'rails_helper'

RSpec.describe 'Roadtrip API' do
  it "can have a travel time between locations" do
    VCR.use_cassette('roadtrip_request_denver_co') do
      user = User.create!(email: "jane@jane.com", password: "123456", password_confirmation: "123456", api_key: "jgn983hy48thw9begh98h4539h4")
      
      {
        origin: "Denver,CO",
        destination: "Pueblo,CO",
        api_key: "jgn983hy48thw9begh98h4539h4"
      }
   
      post '/api/v1/roadtrip?origin=denver,co&destination=pueblo,co'
  
      parsed_data = JSON.parse(response.body, symbolize_names: true)
  
      expect(response.status).to eq(200)
      expect(parsed_data[:data]).to be_a(Hash)
      expect(parsed_data[:data][:id]).to eq("null")
      expect(parsed_data[:data][:type]).to eq("roadtrip")
      expect(parsed_data[:data][:attributes]).to be_a(Hash)
      expect(parsed_data[:data][:attributes][:start_city]).to eq("denver,co")
      expect(parsed_data[:data][:attributes][:end_city]).to eq("pueblo,co")
      expect(parsed_data[:data][:attributes][:travel_time]).to be_a(String)
      expect(parsed_data[:data][:attributes][:weather_at_eta]).to be_a(Hash)
      expect(parsed_data[:data][:attributes][:weather_at_eta].keys).to eq([:datetime, :temperature, :condition])
    end
  end

  it "cannot have a travel time between locations if the origin is missing" do
    VCR.use_cassette('roadtrip_request_origin_sad_denver_co') do
      user = User.create!(email: "jane@jane.com", password: "123456", password_confirmation: "123456", api_key: "jgn983hy48thw9begh98h4539h4")
        
      {
        origin: "",
        destination: "Pueblo,CO",
        api_key: "jgn983hy48thw9begh98h4539h4"
      }
  
      post '/api/v1/roadtrip?origin=&destination=pueblo,co'
  
      expect(response.status).to eq(400)
    end
  end

  it "cannot have a travel time between locations if the destination is missing" do
    VCR.use_cassette('roadtrip_request_destination_sad_denver_co') do
      user = User.create!(email: "jane@jane.com", password: "123456", password_confirmation: "123456", api_key: "jgn983hy48thw9begh98h4539h4")
          
      {
        origin: "Denve, CO",
        destination: "",
        api_key: "jgn983hy48thw9begh98h4539h4"
      }

      post '/api/v1/roadtrip?origin=denver,co&destination='

      expect(response.status).to eq(400)
    end
  end

  it "cannot have a travel time between locations if the destination is impossible" do
    VCR.use_cassette('roadtrip_request_destination_impossible_sad_denver_co') do
      # impossible
      user = User.create!(email: "jane@jane.com", password: "123456", password_confirmation: "123456", api_key: "jgn983hy48thw9begh98h4539h4")
            
      {
        origin: "Denver,CO",
        destination: "London,UK",
        api_key: "jgn983hy48thw9begh98h4539h4"
      }
  
      post '/api/v1/roadtrip?origin=denver,co&destination=london,uk'

      expect(response.status).to eq(200)

      parsed_data = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_data[:data][:attributes][:travel_time]).to eq("impossible route")
    end
  end

  it "cannot have a travel time between locations if the api key is invalid" do
    VCR.use_cassette('roadtrip_request_invalid_api_key_sad_denver_co') do
      user = User.create!(email: "jane@jane.com", password: "123456", password_confirmation: "123456", api_key: "jgn983hy48thw9begh98h4539h4")
              
      {
        origin: "Denver,CO",
        destination: "Pueblo,CO",
        api_key: "jgn983hy48thw"
      }

      post '/api/v1/roadtrip?origin=denver,co&destination=pueblo,co&api_key=invalid_key'
      # If no API key is given, or an incorrect key is provided, return 401 (Unauthorized)

      expect(response.status).to eq(401)
    end
  end

  it "cannot have a travel time between locations if the api key is missing" do
    VCR.use_cassette('roadtrip_request_missing_api_key_sad_denver_co') do
      user = User.create!(email: "jane@jane.com", password: "123456", password_confirmation: "123456", api_key: "jgn983hy48thw9begh98h4539h4")
                
      {
        origin: "Denver,CO",
        destination: "Pueblo,CO",
        api_key: ""
      }

      post '/api/v1/roadtrip?origin=denver,co&destination=pueblo,co&api_key='
 
      expect(response.status).to eq(401)
    end
  end
end