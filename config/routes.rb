Rails.application.routes.draw do
  root "static_pages#home"
  resources :songs
  resources :singers
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users
end
