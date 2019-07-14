Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      get :followings
      get :followers
      get :likes
    end
    collection do
      get :search
    end
  end
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
    member do
      get :timeline
    end
  end
  
  get 'ranking', to: 'posts#ranking'
  
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end