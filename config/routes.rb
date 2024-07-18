Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'events/index'
  root to: "events#index"
  resources :events do
    resources :comments, only: :create
  end

  resources :users

  get 'description', to: 'pages#description'
end
