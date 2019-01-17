Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  
  resources :teams do
    resources :themes, only: [:new, :create]
  end
  
  resources :relationships, only: [:create, :destroy]
  
  resources :themes, only: [:index, :show, :edit, :update, :destroy] do
    resources :references, only: [:create, :destroy]
    resources :tasks, only: [:new, :create]
  end
  
  resources :team_themes, only: [:create, :destroy]
  
  resources :tasks, only: [:show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
end
