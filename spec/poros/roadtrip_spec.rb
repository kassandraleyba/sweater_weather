require 'rails_helper'

RSpec.describe 'Roadtrip API' do
  it "exists" do
    roadtrip =  
      {
        :attributes => {
            :start_city => "Cincinatti, OH",
            :end_city => "Chicago, IL",
            :travel_time => "04:40:45",
            :weather_at_eta => {
                :datetime => "2023-04-07 23:00",
                :temperature => 44.2,
                :condition => "Cloudy with a chance of meatballs"
            }
        }
      }

    roadtrip_data = Roadtrip.new(roadtrip)

    expect(roadtrip_data).to be_a(Roadtrip)
  end
end