Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update, :show]
  resources :texts, only: [:new, :create, :edit, :update, :show, :index, :destroy]
  resources :posts, only: [:new, :create, :edit, :update, :show, :index, :destroy] do
    resources :messages, only: [:index, :create, :destroy, :edit]
    resources :likes, only: [:create, :destroy, :index]
  end
  root to: "posts#index"
end
