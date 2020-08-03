class Api::V1::UsersController < ApplicationController

  def create
    # parsed_request = JSON.parse(request.body.read, symbolize_names: true))

    user = User.new(user_params)

    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: {body: user.errors.full_messages.to_sentence}, status: 400
    end
  end

  private

  def user_params
    generated_key = NumberGenerator.new.api_key_generator
    api_key = {api_key: "#{generated_key}"}

    params.permit(:email,:password,:password_confirmation).reverse_merge(api_key)
  end


end
