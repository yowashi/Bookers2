Rails.application.routes.draw do
  devise_for :users
  root to:'home#index'
  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :create, :edit, :update]
  resources :books, only: [:index,:new, :create,:update, :show, :edit, :destroy]
end
