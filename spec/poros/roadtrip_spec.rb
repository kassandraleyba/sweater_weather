require 'rails_helper'

RSpec.describe 'Roadtrip API' do
  it "exists" do
    VCR.use_cassette('roadtrip_poros_denver_co') do
      start_city = {:start_city => "Cincinatti, OH"} 
  
      end_city = {:end_city => "Chicago, IL"}
  
      travel_time = {:travel_time => "04:40:45"}
  
      weather_at_eta = { :weather_at_eta => {
                  :datetime => "2023-04-07 23:00",
                  :temperature => 44.2,
                  :condition => "Cloudy with a chance of meatballs"
              }}
       
  
      roadtrip_data = Roadtrip.new(start_city, end_city, travel_time, weather_at_eta)
  
      expect(roadtrip_data).to be_a(Roadtrip)
    end
  end
end