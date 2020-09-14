Rails.application.routes.draw do
  default_url_options :host => "localhost"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#feedPhoto'
  get 'discovery/photo', to: 'home#disPhoto'
  get 'discovery/album', to: 'home#disAlbum'
  get 'feed/album', to: 'home#feedAlbum', as: "feedAlbum"
  get 'feed/photo', to: 'home#feedPhoto', as: "feedPhoto"
  post '/user/:id/follow', to: 'user#follow', as: "follow_user"
  post '/user/:id/unfollow', to: 'user#unfollow', as: "unfollow_user"
  post ':id/like', to: 'photos#like', as: "like"
  post ':id/unlike', to: 'photos#unlike', as: 'unlike'
  resources :user, except: [:create, :new] do
    resources :photos
    resources :albums
    member do
      get :followings, :followers
    end
  end  
  resources :admin, only: [:show]
  resources :image, only: [:destroy] 
end
