Rails.application.routes.draw do
  resources :payments do
    member do
      get :confirm_data
      put :pay
      get :receipt
    end
  end
  
  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: :registrations}
  resources :users
  resources :after_signup
end
