class Api::V1::UsersController < ApplicationController
  include CurrentUserConcern
  def create
    user = User.find_by(email_address: params['user']['email_address'])
      .try(:authenticate, params['user']['password'])

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user:
      }
    else
      render json: {
        status: 401
      }
    end
  end

  # This handles if current user is logged in or not
  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  # Logged out
  def logout
    reset_session
    render json: {
      status: 200,
      logged_out: true
    }
  end
end
