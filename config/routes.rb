Rails.application.routes.draw do
  devise_for :users
  root to: 'cooks#index'
  resources :cooks do
    resources :comments, only: :create
  end
  resources :users, only: :show
end
