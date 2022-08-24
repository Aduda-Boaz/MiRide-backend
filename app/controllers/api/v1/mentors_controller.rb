class Api::V1::MentorsController < ApplicationController
  def index
    mentors = Mentor.all
    render json: mentors
  end

  def show
    mentor = Mentor.new(mentor_params)
    render json: mentor
  end

  def create
    mentor = Mentor.new(mentor_params)
    if mentor.save
      render json: mentor
    else
      render json: { error: mentor.errors.messages }, status: 422
    end
  end

  def destroy
    mentor = Mentor.find(params[:id])
    if mentor.destroy
      head :no_content
    else
      render json: { error: mentor.errors.messages }, status: 422
    end
  end

  private

  def mentor_params
    params.require(:mentor).permit(:full_name, :bio, :image_url, :specialisation)
  end

  # def options
  #     @options ||= { include: %i[reservations]}
  # end
end
