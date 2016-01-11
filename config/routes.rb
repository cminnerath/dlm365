Rails.application.routes.draw do
  resources :minis
  resource :sessions, :only => [:create]

  root to: 'minis#index'
  get '/auth/:provider/callback' => 'sessions#create'
end
