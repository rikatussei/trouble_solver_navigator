Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]

  root to: "events#index"
  resources :events do
    resources :comments, only: :create
  end

  get 'description', to: 'pages#description'
end
