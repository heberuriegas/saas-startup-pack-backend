require 'sidekiq/web'
require 'api_constraints'

Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => 'users/registrations',
    :passwords => 'users/passwords',
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  post "/graphql", to: "graphql#execute"
  
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      get '/auth/user', to: 'auth#user'
      
      get '/auth/hasura', to: 'auth#hasura'
      post 'auth/hasura', to: 'auth#hasura'
      
      post '/auth/send_otp', to: 'auth#send_otp'
      
      mount HasuraHandler::Engine => '/hasura'
      
      resources :direct_uploads, only: [:create]
    end
  end
  
  if Rails.env.development?
    mount GraphqlPlayground::Rails::Engine, at: "/graphql_playground", graphql_path: "/graphql"
  end
  
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == Rails.application.credentials.sidekiq[:username] &&
    password == Rails.application.credentials.sidekiq[:password]
  end
  
  mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app

  get "/health", to: "health#index"
end