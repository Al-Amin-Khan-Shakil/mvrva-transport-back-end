class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!
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
    @reservation = current_user.reservations.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :ok
    else
      render json: { data: @reservation.errors.full_messages, status: 'failed' }, status: :unprocessable_entity
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
    params.require(:reservation).permit(:pickup_address, :drop_address, :description, :contact, :pickup_date,
                                        :service_id, :client_name)
  end
end
