Rails.application.routes.draw do
  root "static_pages#home"
  resources :songs
  resources :singers
end
