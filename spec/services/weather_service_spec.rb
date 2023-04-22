require 'rails_helper'

RSpec.describe WeatherService do
  context "instance methods" do
    it "can get directions" do
      forecast = WeatherService.new.find_current_forecast("Denver, CO")

      expect(forecast).to be_a(Hash)
    end
  end
end