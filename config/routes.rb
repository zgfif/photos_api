# frozen_string_literal: true

Rails.application.routes.draw do
  post '/auth', to: 'authentication#auth'
  get '/images', to: 'images#index'
  get 'images/page', to: 'images#index'
end
