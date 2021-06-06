class AuthenticationController < ApplicationController
  def auth
    if (params[:apiKey] == api_key)
      user = User.find(params[:user_id])

      if user.need_new_token?
        user.token = Token.new.retrieve
        user.token_expires = Time.now + 1.day
        user.save
      end
      render json: {token: user.token }, status: :created
    else
      render json: {}, status: :forbidden
    end
  end

  private

  def api_key
    Rails.application.credentials.api_key
  end
end
