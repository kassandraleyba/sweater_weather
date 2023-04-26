class Api::V1::RoadtripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if !params[:origin].present?
      render json: { error: "Please enter a location" }, status: 400
    elsif !params[:destination].present?
      render json: { error: "Please enter a destination" }, status: 400
    else
      forecast = RoadtripFacade.new.find_roadtrip_info(params[:origin], params[:destination])

      if params[:api_key] != User.find_by(api_key: params[:api_key])
        render json: {error: "Unauthorized"}, status: 401
      else
        forecast = RoadtripFacade.new.find_roadtrip_info(params[:origin], params[:destination])
        render json: RoadtripSerializer.new(forecast)
      end
    end
  end
end