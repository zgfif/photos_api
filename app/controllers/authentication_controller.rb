class AuthenticationController < ApplicationController
  def auth
    if params[:apiKey] == api_key
      update_user_token if user.need_new_token?

      render json: { token: user.token }, status: :created
    else
      render json: {}, status: :forbidden
    end
  end

  private

  def api_key
    Rails.application.credentials.api_key
  end

  def user
    @user ||= User.find(params[:user_id])
  end

  def update_user_token
    user.token = token
    user.token_expires = Time.now + 1.day
    user.save
  end

  def token
    Token.new.retrieve
  end
end
