Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] 
  
  get 'events/index'
  root to: "events#index"
  resources :events
    resources :comments, only: :create 

  get 'description', to: 'pages#description'
  resources :comments, only: :create 
end