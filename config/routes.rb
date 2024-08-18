Rails.application.routes.draw do
  root 'dashboard#index'
  
  devise_for :users
  
  resources :forms do
    resources :questions
    resources :responses, only: [:index, :show, :create]
  end
  
  namespace :api do
    resources :forms, only: [:show] do
      resources :responses, only: [:create]
    end
  end
end