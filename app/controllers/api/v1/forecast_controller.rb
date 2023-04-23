class Api::V1::ForecastController < ApplicationController
  def index
    binding.pry
    @current = ForecastFacade.new.find_current_forecast(params[:location])
    @forecast = ForecastFacade.new.find_5_day_forecast(params[:location])
  end
end