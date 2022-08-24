class Api::V1::RegistrationsController < ApplicationController
  def create
    user = User.create!(
      email_address: params[:user][:email_address],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation]
    )
    if user
      session[:user_id] = user.id
      render json: {
        status: :create,
        user:
      }
    else
      render json: { status: 500 }
    end
  end
end
