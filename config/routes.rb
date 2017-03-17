Rails.application.routes.draw do
  get "/loaderio-371409206577e205db894c2d41bcc837", to: "loaderio#verify"

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
