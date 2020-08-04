class Api::V1::SessionsController < ApplicationController

  def create

    user = User.find_by(email: user_params[:email])

    if user && user.authenticate(user_params[:password])

      render json: UserSerializer.new(user)
    else

      render json: {body: "Sorry, your credentials are bad."}, status: 400
    end
  end

    private

    def user_params
      params.permit(:email, :password)
    end




end
