Rails.application.routes.draw do
  devise_for :users
  # resources :users
  get 'pages/index'
  get 'pages/fill'
  get 'pages/result'
  get 'pages/destroy_payment'
  get 'pages/confirm_payment'
  root 'pages#index'
  resources :payments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
