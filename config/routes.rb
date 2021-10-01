Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  get '/', to: 'speed_test#dashboard'
  get '/results', to: 'speed_test#index'
end
