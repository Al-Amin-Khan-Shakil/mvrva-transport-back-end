class Api::V1::ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create destroy]
  before_action :set_reservation, only: %i[show destroy]
  load_and_authorize_resource

  def index
    @reservations = current_user&.reservations
    render json: @reservations, status: :ok
  end

  def show
    render json: @reservation, status: :ok
  end

  def create
    if current_user
      @reservation = current_user.reservations.build(reservation_params)
      Rails.logger.debug "Current user: #{current_user.inspect}"
      Rails.logger.debug "New reservation: #{@reservation.inspect}"
      authorize! :create, @reservation
      if @reservation.save
        render json: @reservation, status: :ok
      else
        render json: { data: @reservation.errors.full_messages, status: 'failed' }, status: :unprocessable_entity
      end
    else
      render json: { data: 'User not authenticated', status: 'failed' }, status: :unauthorized
    end
  end

  def destroy
    if @reservation.destroy
      render json: { data: 'Reservation was removed successfully', status: 'success' }, status: :ok
    else
      render json: { data: 'Something went wrong, reservation is not canceled', status: 'failed' }
    end
  end

  private

  def set_reservation
    @reservation = current_user.reservations.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: e.message, status: :unauthorized
  end

  def reservation_params
    params.require(:reservation).permit(:pickup_address, :drop_address, :description, :contact, :pickup_date, :service_id)
  end
end
