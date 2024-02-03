class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  respond_to :json
  before_action :authenticate_user!, only: [:destroy]

  def create
    super do |user|
      if user.valid?
        @token = request.env['warden-jwt_auth.token']
        headers['Authorization'] = @token
      end
    end
  end

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: { code: 200, message: 'Signed in successfully.', data: current_user },
      user: resource, Authorization: @token
    }
  end

  def respond_to_on_destroy
    auth_header = request.headers['Authorization']
    if auth_header
      begin
        token = auth_header.split[1]
        jwt_payload = JWT.decode(token, Rails.application.credentials.fetch(:secret_key_base)).first
        current_user = User.find_by(id: jwt_payload['sub'])
        if current_user
          User.revoke_jwt(nil, current_user)
          render json: {
            status: 200,
            message: 'Signed out successfully.'
          }, status: :ok
        else
          render json: {
            status: 401,
            message: "Couldn't find an active session."
          }, status: :unauthorized
        end
      rescue JWT::DecodeError => e
        render json: {
          status: 401,
          message: "Invalid token: #{e.message}"
        }, status: :unauthorized
      end
    else
      render json: {
        status: 401,
        message: "Missing token."
      }, status: :unauthorized
    end
  end
end
