Rails.application.routes.draw do
  
  devise_for :users
  root 'static_pages#home'

  # resources :users

  get '/posts', to: 'posts#index'
  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy] 
  end
  
  get '/about', to: 'static_pages#about'

  get 'users/:id', to: 'users#show', as: 'user'

  resources :posts do
    resources :likes
  end


end
