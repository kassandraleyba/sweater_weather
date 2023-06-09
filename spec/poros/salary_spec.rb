require 'rails_helper'

RSpec.describe Salary do
  it "exists" do
    salaries = {

    :salaries => [
      {
        :job => {:title=>"Data Analyst"},
        :salary_percentiles => {
          :percentile_25 => 46898.18614517015, 
          :percentile_75 => 67929.18726447425
        }
      },
      
      {
        :job => {:title=>"Data Scientist"},
        :salary_percentiles => {
          :percentile_25 => 71025.60310363481, 
          :percentile_75 => 103647.55438088557
        }
      },

      {
        :job => {:title=>"QA Engineer"},
        :salary_percentiles => {
          :percentile_25 => 46022.824981352605, 
          :percentile_75 => 69936.64316734018
        }},
      {
        :job => {:title=>"Mobile Engineer"},
        :salary_percentiles => {
          :percentile_25 => 46022.824981352605, 
          :percentile_75 => 69936.64316734018
        }},
      
      {
        :job => {:title=>"Software Engineer"},
        :salary_percentiles => {
          :percentile_25 => 67646.2253013339, 
          :percentile_75 => 100496.16768133474
        }},
      
      {
        :job => {:title=>"Systems Administrator"},
        :salary_percentiles => {
          :percentile_25 => 54967.079284456646, 
          :percentile_75 => 79616.94187484588
        }},
      
      {
        :job => {:title=>"Web Developer"},
        :salary_percentiles => {
          :percentile_25 => 53704.53793049536, 
          :percentile_75 => 82456.50473241684
        }},
      ]
    }

    forecast =  {
      :summary => "Cloudy with a chance of meatballs",
      :temperature => "83 F"
    }

    destination = "chicago"

    salary = Salary.new(salaries, forecast, destination)

    expect(salary).to be_a(Salary)
    expect(salary.id).to eq("null")
    expect(salary.type).to eq('salaries')
    expect(salary.salaries).to eq(salaries)
    expect(salary.forecast).to eq(forecast)
    expect(salary.destination).to eq(destination)
  end
end