Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index' 
  namespace :events do
    resources :searches, only: :index
  end
  resources :events do
    resources :comments, only: :create
  end
  resources :users, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
