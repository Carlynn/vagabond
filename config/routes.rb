Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "locations#index"

  resources :users, param: :slug
  # route for log-in screen
  get "/login" => "sessions#new"
  # route for creating new session id
  post "/sessions" => "sessions#create"
  # route to logging out of the session
  get "/logout" => "sessions#destroy"

  resources :posts
  resources :locations, param: :slug

 end
