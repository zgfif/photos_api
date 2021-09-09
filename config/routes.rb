# frozen_string_literal: true

Rails.application.routes.draw do
  post '/auth', to: 'authentication#auth'
  get '/images/:id', to: 'images#show'
  get '/images/', to: 'images#index'
end
