Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :users, only: [:edit, :update]
  resources :posts, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
  end
end
