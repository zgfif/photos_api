# frozen_string_literal: true

# this class is used to handle authentication
class AuthenticationController < ApplicationController
  def auth
    if correct_api_key?
      update_user_token if user.need_new_token?

      render json: { token: user.token }, status: :created
    else
      render status: :forbidden
    end
  end

  private

  def correct_api_key?
    params[:apiKey] == Rails.application.credentials.api_key
  end

  def user
    @user ||= User.find(params[:user_id])
  end

  def update_user_token
    user.update!(token: token, token_expires: Time.now + 1.day)
  end

  def token
    TokenGeneration.new.get
  end
end
