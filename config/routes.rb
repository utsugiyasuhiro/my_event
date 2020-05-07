Rails.application.routes.draw do
  root to: 'events#index'
  resources :events, only: [:index, :new, :create, :destroy] 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
