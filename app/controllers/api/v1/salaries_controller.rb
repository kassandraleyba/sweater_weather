class Api::V1::SalariesController < ApplicationController
  def index
    # params = {"destination"=>"chicago", "controller"=>"api/v1/salaries", "action"=>"index"}
    # binding.pry
    if params[:destination].nil?
      render json: { error: "Please enter a destination" }, status: 400
    else
      salary = SalaryFacade.new.find_salary(params[:destination])
      render json: SalarySerializer.new(salary)
    end
  end
end