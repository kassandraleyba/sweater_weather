class Api::V1::RoadtripController < ApplicationController
  def index
    if params[:location].nil?
      render json: { error: "Please enter a location" }, status: 400
    elsif params[:destination].nil?
      render json: { error: "Please enter a destination" }, status: 400
    else
      forecast = RoadtripFacade.new.find_roadtrip_info(params[:location], params[:destination])
      render json: RoadtripSerializer.new(forecast)
    end
  end
end