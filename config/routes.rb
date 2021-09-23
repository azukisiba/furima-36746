Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items do
    resources :comments, only: [:create, :destroy]
    resources :orders, only: [:index, :create]
  end
end
