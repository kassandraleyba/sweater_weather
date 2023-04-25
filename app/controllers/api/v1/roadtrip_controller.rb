class Api::V1::RoadtripController < ApplicationController
  def create
    if !params[:origin].present?
      render json: { error: "Please enter a location" }, status: 400
    elsif !params[:destination].present?
      render json: { error: "Please enter a destination" }, status: 400
    else
      forecast = RoadtripFacade.new.find_roadtrip_info(params[:origin], params[:destination])
      if forecast.is_a?(Roadtrip)
        forecast = RoadtripFacade.new.find_roadtrip_info(params[:origin], params[:destination])
        render json: RoadtripSerializer.new(forecast)
      else
        render json: { error: "Destination is impossible" }, status: 400
      end
    end
  end
end