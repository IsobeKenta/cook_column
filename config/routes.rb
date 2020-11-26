Rails.application.routes.draw do
  devise_for :users
  root to: 'cooks#index'
  resources :cooks
  resources :users, only: :show
end
