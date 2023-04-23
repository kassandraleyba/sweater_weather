require 'rails_helper'

RSpec.describe 'Users' do
  describe "when the request is valid" do
    it "can create a new user" do
      user_attrs = {
        email: "jane@jane.com",
        password: "password1",
        password_confirmation: "password1"
      }

      User.destroy_all
      #deletes all users in database before each test

      post "/api/v1/users", params: user_attrs.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      # to ensure that the request is being sent as JSON
      data = JSON.parse(response.body, symbolize_names: true)
    
      expect(response.status).to eq(201)
      expect(data[:data][:attributes][:email]).to eq(user_attrs[:email])
      expect(data[:data][:attributes][:api_key]).to_not be_nil
    end
  end

  describe "when the request is invalid" do
    it "cannot create a new user if password don't match" do
      user_attrs = {
        email: "jane@jane.com",
        password: "password1",
        password_confirmation: "pass"
      }
      User.destroy_all
      post "/api/v1/users", params: user_attrs.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }

      expect(response.status).to eq(400)
      expect(response.body).to include("Password confirmation doesn't match Password")
    end

    it "cannot create a new user if password is missing" do
      user_attrs = {
        email: "jane@jane.com",
        password: "",
        password_confirmation: ""
      }
      User.destroy_all
      post "/api/v1/users", params: user_attrs.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }

      expect(response.status).to eq(400)
      expect(response.body).to include("Password can't be blank")
    end

    it "cannot create a new user if email is missing" do
      user_attrs = {
        email: "",
        password: "password",
        password_confirmation: "password"
      }
      User.destroy_all
      post "/api/v1/users", params: user_attrs.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }

      expect(response.status).to eq(400)
      expect(response.body).to include("Email can't be blank")
    end

    it "cannot create a new user if email already exists" do
      user_attrs = {
        email: "jane@jane.com",
        password: "password",
        password_confirmation: "password"
      }

      User.destroy_all
      post "/api/v1/users", params: user_attrs.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      expect(response.status).to eq(201)

      post "/api/v1/users", params: user_attrs.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
  
      expect(response.status).to eq(400)
      expect(response.body).to include("Email has already been taken")
    end
  end
end