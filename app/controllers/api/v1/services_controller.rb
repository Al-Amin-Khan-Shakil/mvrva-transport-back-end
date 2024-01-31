class Api::V1::ServicesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: %i[index show]

  def index
    render json: { services: Service.all }
  end

  def show
    render json: { service: Service.find_by_id(params[:id]) }
  end

  def create
    @service = current_user.services.new(service_params)
    if @service.save
      render json: { data: 'Service was added successfully', status: 'success' }, status: :ok
    else
      render json: { error: 'Service was not created.' }
    end
  end

  def destroy
    @service = Service.find_by_id(params[:id])
    if @service.destroy
      render json: { data: 'Service was removed successfully', status: 'success' }, status: :ok
    else
      render json: { error: 'Service was not deleted.' }
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :image, :min_cost)
  end
end
