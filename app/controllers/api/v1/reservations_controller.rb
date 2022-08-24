class Api::V1::ReservationsController < ApplicationController
  def index
    reservations = Reservation.all
    render json: reservations
  end

  def show
    reservation = Reservation.find_by(id: params[:id])
    render json: reservation
  end

  def create
    reservation = Reservation.new(reservation_params)
    if reservation.save
      render json: reservations
    else
      render json: { error: reservation.errors.messages }, status: 422
    end
  end

  def update
    reservation = Reservation.find_by(id: params[:mentor_id])
    if reservation.update(reservation_params)
      render json: reservation
    else
      render json: { error: reservation.errors.messages }, status: 422
    end
  end

  def destroy
    reservation = Reservation.find_by(id: params[:mentor_id])
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

  # def options
  #     @options ||= { include: %i[users, mentors]}
  # end
end
