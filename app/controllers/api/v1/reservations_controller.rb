class Api::V1::ReservationsController < ApplicationController
  before_action :current_user

  def index
    reservations = current_user.Reservation.all
    render json: reservations
  end

  def show
    reservation = current_user.Reservation.find_by(id: params[:id])
    render json: reservation
  end

  def create
    reservation = current_user.Reservation.new(reservation_params)
    if reservation.save
      render json: reservations
    else
      render json: { error: reservation.errors.messages }, status: 422
    end
  end

  def update
    reservation = current_user.Reservation.find_by(id: params[:mentor_id])
    if reservation.update(reservation_params)
      render json: reservation
    else
      render json: { error: reservation.errors.messages }, status: 422
    end
  end

  def destroy
    reservation = current_user.Reservation.find_by(id: params[:mentor_id])
    if reservation.destroy
      head :no_content
    else
      render json: { error: reservation.errors.messages }, status: 422
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:duration, :mentor_id, :user_id)
  end

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end
end
