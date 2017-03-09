Rails.application.routes.draw do
  resources :payments
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
