Rails.application.routes.draw do
  
  resources :followers, only: [:index, :show, :destroy]
  resources :comments
  resources :options, only: [:index, :show, :create, :update]
  resources :votes
  resources :boards
  resources :users

  get "/me", to: "sessions#show"
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/following", to: "followers#following"
  post "/follow", to: "followers#follow"

  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

end
