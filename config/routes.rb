Rails.application.routes.draw do
  resources :payments
  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: :registrations}
  resources :users
  resources :after_signup
end
