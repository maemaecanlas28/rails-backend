Rails.application.routes.draw do
  
  resources :follows
  resources :comments
  resources :options
  resources :votes
  resources :boards
  resources :users
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

end
