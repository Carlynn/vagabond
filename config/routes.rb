Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#index"

  resources :users
  # route for log-in screen
  get "/login" => "sessions#new"
  # route for creating new session id
  post "/sessions" => "sessions#create"
  # route to logging out of the session
  get "/logout" => "sessions#destroy"


  # route to open a new form for a post
  # get "/users/:id/new" => "posts#new"
  get "/users/:id/posts" => "posts#new"

  # create a new post for that user id (upon submission of post)
  # post "/users/:id" => "posts#create"
  post "/users/:id/posts" => "posts#create"

  # show all posts on the profile page - have above "get "/users/:id" => "user#show"

  # from the profile page - ability to edit ONE post
  # get "/users/:id/:post_id/edit" => "posts#edit"
  get "/users/:id/posts/:post_id/edit" => "posts#edit", as: "edit_post"

  # updating post upon edit (not sure why rails wants an edit but it wants it)
  patch "/users/:id/posts/:post_id/edit" => "posts#update"

  # show page showing that one single post
  get "/users/:id/posts/:post_id" => "posts#show"

  # show all the locations
  get "/locations" => "locations#index"

  # show all post for that location
  get "/locations/:location_id" => "locations#show"
end
