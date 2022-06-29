Rails.application.routes.draw do

  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:create, :show, :edit, :update, :destroy]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post 'legends/random', to: 'legends#random'
  post 'legends/random_destroy', to: 'legends#random_destroy'
  resources :legends, only: [:index, :show]

  post 'weapons/random', to: 'weapons#random'
  post 'weapons/random_destroy', to: 'weapons#random_destroy'
  resources :weapons, only: [:index, :show]
  
  post 'ammos/random', to: 'ammos#random'
  post 'ammos/random_destroy', to: 'ammos#random_destroy'
  resources :ammos, only: [:index, :show]

  resources :stages, only: [:index, :show]
  
  resources :battle_records, only: [:index, :new, :create, :edit, :update, :destroy]

end
