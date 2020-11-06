Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

  
  root :to => "homes#top"
  get "home/about" => "homes#about"


  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] 
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end



end
