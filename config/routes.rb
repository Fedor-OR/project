Rails.application.routes.draw do
  
  devise_for :users
  root 'static_pages#home'

  get '/posts', to: 'posts#index'
  resources :posts do
    resources :comments, only: [:create]
  end
  
  # resourse :posts, only: [:index, :show]


  get '/about', to: 'static_pages#about'

  


end
