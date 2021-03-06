Rails.application.routes.draw do
  #get 'sessions/new'
  #get 'sessions/create'
  #get 'sessions/destroy'
  root to: 'toppages#index'
  
  #get 'users/index'
  #get 'users/show'
  #get 'users/new'
  #get 'users/create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  #post 'tasks/new'

  get 'signup', to: 'users#new'
  resources :tasks
  resources :users, only: [:show, :new, :create]
end
