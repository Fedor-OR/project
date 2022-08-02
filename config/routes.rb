Rails.application.routes.draw do
  
  resources :follows, only: [:create, :destroy]
  devise_for :users
  root 'static_pages#home'

 
  
  post 'users/:id/follow', to: "users#follow", as: "follow_user"

  post 'users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  get 'users/:id/followers', to: "follows#followers", as: "followers_user"

  get 'users/:id/following', to: "follows#following", as: "following_user"

  get 'users/:id', to: 'users#show', as: 'user'
  

  get '/posts', to: 'posts#index'
  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy] 
  end
  
  get '/about', to: 'static_pages#about'

  resources :posts do
    resources :likes
  end


end
