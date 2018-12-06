Rails.application.routes.draw do
  root "static_pages#home"
  resources :songs
  resources :singers
  resources :users
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "sessions/new"
  resources :users
  resources :singers
  resources :comments, only: %i(create destroy)
  resources :genres
end
