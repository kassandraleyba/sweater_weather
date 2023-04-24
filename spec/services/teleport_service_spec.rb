require 'rails_helper'

RSpec.describe TeleportService do
  it "can find urban area salaries by id" do
    data = TeleportService.new.find_urban_area_salaries_by_id("teleport:dp3wn")
    #chicago id = dp3wn
    binding.pry
    expect(data).to be_a(Hash)
  end

  xit "can find salaries by destination" do
    data = TeleportService.new.find_salaries_by_destination("chicago")
    
    # binding.pry
    expect(data).to be_a(Hash)
  end
end