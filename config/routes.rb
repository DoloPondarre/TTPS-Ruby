Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  scope '/admin' do
    resources :users
  end
  
  resources :shifts
  resources :roles
  resources :users
  resources :schedules
  resources :branches

  match '/signup', to:'users#new', via:'get'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  match '/home', to: 'home#index', via: 'get'
  
  root to: 'home#index'
end
