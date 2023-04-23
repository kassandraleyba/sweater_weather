class Api::V1::UsersController < ApplicationController
  def create
    #create a user
    user = User.new(user_params)

    if user.save
      # binding.pry
      render json: UserSerializer.new(user), status: 201
    else
      render json: { error: user.errors.full_messages }, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end