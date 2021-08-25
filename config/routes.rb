Rails.application.routes.draw do
  get 'images/index'
  post '/auth', to: 'authentication#auth'
  get '/images', to: 'images#index'
end
