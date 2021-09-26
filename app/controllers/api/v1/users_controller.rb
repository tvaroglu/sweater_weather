class Api::V1::UsersController < ApplicationController
  def create
    if user_params[:password_confirmation].blank?
      json_error_response("'password_confirmation' is required to create a user account")
    else
      new_user = User.create!(user_params)
      if new_user.save
        new_user.update_api_key
        render json: UserSerializer.new(new_user).serializable_hash, status: :created
      end
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
