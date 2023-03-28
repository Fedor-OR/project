Rails.application.routes.draw do
  
  devise_for :users

  root 'static_pages#home'



  # resources :follows, only: [:create, :destroy]
  
  post 'users/:id/follow', to: "follows#create", as: "follow_user"

  delete 'users/:id/unfollow', to: "follows#destroy", as: "unfollow_user"

  get 'users/:id/followers', to: "follows#followers", as: "followers_user"

  get 'users/:id/following', to: "follows#following", as: "following_user"



  get 'users/:id', to: 'users#show', as: 'user'
  
  get '/posts', to: 'posts#index'
  

  
  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy] 
  end
  
  get '/about', to: 'static_pages#about'

  resources :posts do
    resources :likes, only: [:create, :destroy]
  end


end
