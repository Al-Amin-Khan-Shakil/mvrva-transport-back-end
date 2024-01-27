class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    render json: @users
  end

  def show_current_user
    if user_signed_in?
      render json: current_user
    else
      render json: { error: 'No user logged in' }, status: :unauthorized
    end
  end
end
