class Api::V1::SessionsController < ApplicationController
  def create
    found_user = User.find_by(email: user_params[:email])
    if found_user && found_user.authenticate(user_params[:password])
      render json: UserSerializer.new(found_user).serializable_hash, status: :created
    else
      json_error_response(record_invalid, params_errors[:credentials], :unauthorized)
    end
  end

  private

  def params_errors
    { credentials: 'invalid credentials provided, please try again' }
  end

  def user_params
    params.permit(:email, :password)
  end
end
