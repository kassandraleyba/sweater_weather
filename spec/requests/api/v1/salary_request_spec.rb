require 'rails_helper'

RSpec.describe 'Salary API' do
  it "can get salaries for a city" do
    # should follow this format
    # GET /api/v1/salaries?destination=chicago

    get '/api/v1/salaries?destination=chicago'

    expect(response).to be_successful

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data[:data]).to be_a(Hash)
  end
end