Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] 
  
  get 'events/index'
  root to: "events#index"
  resources :events

end
