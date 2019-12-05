Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update, :show, :index]

  resources :texts, only: [:new, :create, :edit, :update, 
  :show, :index, :destroy] do
    resources :iines, only: [:create, :destroy, :index]
  end

  resources :posts, only: [:new, :create, :edit, :update, :show, :index, :destroy] do
    resources :messages, only: [:index, :create, :destroy, :edit]
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
    resources :likes, only: [:create, :destroy, :index, :show]
  end

  root to: "posts#index"

  resources :mercaris, only: [:index, :new, :create, :show, :edit]
  
end
