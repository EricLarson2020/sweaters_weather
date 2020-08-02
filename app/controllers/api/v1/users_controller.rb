class Api::V1::UsersController < ApplicationController

  def create
    render json: UserSerializer(User.create(user_params))
  end

  private

  def user_params
    api_key = User.key_generator
    params.permit(:email, :password).merge(api_key)
  end


end
