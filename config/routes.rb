Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:show, :edit, :update] do
    resources :members, only:[:index, :new, :create, :edit, :update]
  end
  resources :emails, only:[:index, :new, :create, :show]
end
