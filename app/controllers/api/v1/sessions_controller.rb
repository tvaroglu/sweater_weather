class Api::V1::SessionsController < ApplicationController
  def create
    found_user = User.find_by(email: user_params[:email])
    if found_user && found_user.authenticate(user_params[:password])
      render json: UserSerializer.new(found_user).serializable_hash, status: :ok
    else
      json_error_response('invalid credentials provided, please try again')
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
