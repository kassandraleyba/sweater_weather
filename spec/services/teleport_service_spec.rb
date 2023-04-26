require 'rails_helper'

RSpec.describe TeleportService do
  it "can find urban area salaries by id" do
    VCR.use_cassette('teleport_service') do
      # data = TeleportService.new.find_urban_area_salaries("teleport:dp3wnz")
      data = TeleportService.new.find_urban_area_salaries("chicago")
      #chicago id = dp3wnz
      #slug:chicago
      # binding.pry
      expect(data).to be_a(Hash)
    end
  end
end