class Api::V1::SalariesController < ApplicationController
  def index
    if params[:destination].nil?
      render json: { error: "Please enter a destination" }, status: 400
    else
      salary = SalaryFacade.new.find_salary(params[:destination])
      render json: SalariesSerializer.new(salary)
    end
  end
end