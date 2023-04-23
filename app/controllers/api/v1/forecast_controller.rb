class Api::V1::ForecastController < ApplicationController
  def index
    # binding.pry
    if params[:location].nil?
      render json: { error: "Please enter a location" }, status: 400
    else
      render json: ForecastSerializer.new(Forecast.new(params[:location]))
    end
    # binding.pry
  end
end