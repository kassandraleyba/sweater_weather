class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location].nil?
      render json: { error: "Please enter a location" }, status: 400
    else
      forecast = ForecastFacade.new.find_forecast(params[:location])
      render json: ForecastSerializer.new(forecast)
    end
  end
end