# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    super do |user|
      if user.valid?
        @token = request.env['warden-jwt_auth.token']
        headers['Authorization'] = @token
      end
    end
  end

  # def destroy
  #   jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first
  #   current_user = User.find(jwt_payload['sub'])
  #   if current_user
  #     signed_out = Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
  #     if signed_out
  #       render json: {
  #         status: 200,
  #         message: "Logged out successfully."
  #       }, status: :ok
  #     else
  #       render json: {
  #         status: 401,
  #         message: "Couldn't find an active session."
  #       }, status: :unauthorized
  #     end
  #   else
  #     render json: {
  #       status: 401,
  #       message: "Couldn't find an active session."
  #     }, status: :unauthorized
  #   end
  # end

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: { code: 200, message: 'Signed in successfully.', data: current_user },
      user: resource, 'Authorization': @token
    }
  end

  def respond_to_on_destroy
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first
    current_user = User.find(jwt_payload['sub'])
    if current_user
      render json: {
        status: 200,
        message: "Signed out successfully."
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end