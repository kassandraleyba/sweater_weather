require 'rails_helper'

RSpec.describe SalaryFacade do
  it "can get salaries for a location" do
    VCR.use_cassette('salary_facade') do
      location = "chicago"

      salaries = SalaryFacade.new.find_salary(location)
      
      expect(salaries).to be_a(Salary)
    end
  end
end