# frozen_string_literal: true

Rails.application.routes.draw do
  get '/images/:id', to: 'images#show'
  get '/images/', to: 'images#index'
  get '/search/:term', to: 'images#search'
end
