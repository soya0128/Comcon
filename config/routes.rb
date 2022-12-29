Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:show, :edit, :update]
  resources :members, only:[:index, :new, :create, :edit, :update]
  resources :emails, only:[:index, :new, :create]
end
