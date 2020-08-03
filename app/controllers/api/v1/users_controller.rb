class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    binding.pry
    render json: UserSerializer.new(, status: 201)
  end

  private

  def user_params
    generated_key = NumberGenerator.new.api_key_generator
    api_key = {api_key: "#{generated_key}"}

    params.permit(:email,:password).reverse_merge(api_key)
  end


end

#status :bad_request
