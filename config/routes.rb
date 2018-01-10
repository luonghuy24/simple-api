Rails.application.routes.draw do

  resources :users

  resources :todos do
    resources :items
  end

  resources :notes do
    resources :comments
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

  mount Raddocs::App => "/docs"
end
