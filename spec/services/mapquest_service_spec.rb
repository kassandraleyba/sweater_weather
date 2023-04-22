require 'rails_helper'

RSpec.describe MapquestService do
  context "instance methods" do
    it "can get directions" do
      location = MapquestService.new.find_city_state("Denver, CO")

      expect(location).to be_a(Hash)
    end
  end
end