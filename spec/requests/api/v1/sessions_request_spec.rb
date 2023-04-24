require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'when the login is valid' do
    it 'can start a session' do 
      user = User.create!(email: "john@john.com", password: "password1")

      user_attrs = {
          email: "john@john.com",
          password: "password1"
        }
      
      post "/api/v1/sessions", params: user_attrs.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      # to ensure that the request is being sent as JSON

      data = JSON.parse(response.body, symbolize_names: true)
  
      expect(response.status).to eq(200)
      expect(data[:data][:attributes][:email]).to eq(user_attrs[:email])
      expect(data[:data][:attributes][:api_key]).to_not be_nil
    end
  end

  describe 'when the login is invalid' do
    it "can have an invalid email" do
      user = User.create!(email: "john@john.com", password: "password1")

      user_attrs = {
          email: "john",
          password: "password1"
        }
      
      post "/api/v1/sessions", params: user_attrs.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }

      expect(response.status).to eq(401)
      expect(response.body).to include("Invalid email or password")
    end

    it "can have an invalid password" do
      user = User.create!(email: "john@john.com", password: "password1")

      user_attrs = {
          email: "john@john.com",
          password: "pas"
        }
      
      post "/api/v1/sessions", params: user_attrs.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }

      expect(response.status).to eq(401)
      expect(response.body).to include("Invalid email or password")
    end
  end
end
