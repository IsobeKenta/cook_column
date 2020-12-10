Rails.application.routes.draw do
  devise_for :users
  root to: 'cooks#index'
  resources :cooks do
    resources :comments, only: :create
    collection do
      get 'search'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end 
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :users, only: :show
end
