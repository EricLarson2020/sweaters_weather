class Api::V1::UsersController < ApplicationController

  def create
    
    User.create(user_params)
  end

  private

  def user_params
    params.permit(:email, :password).merge()
  end


end
