Rails.application.routes.draw do
  resources :minis
  resource :sessions, :only => [:create]

  root to: 'site#index'

  get "/auth/:provider/callback" => "sessions#create"
  get "/login"  => redirect("/auth/google_oauth2"), as: :login, via: [:get, :post]
  delete "/logout" => "sessions#destroy", as: :logout
  
end
