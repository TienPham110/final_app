Rails.application.routes.draw do
  default_url_options :host => "localhost"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#feedPhoto'
  get 'discovery/photo', to: 'home#disPhoto'
  get 'discovery/album', to: 'home#disAlbum'
  get 'feed/album', to: 'home#feedAlbum', as: "feedAlbum"
  get 'feed/photo', to: 'home#feedPhoto', as: "feedPhoto"
  post '/user/:id/toggleFollow', to: 'user#toggleFollow', as: "toggleFollow"
  post ':id/toggleLikePhoto', to: 'likes#toggleLikeP', as: 'toggleLikeP'
  post ':id/toggleLikeAlbum', to: 'likes#toggleLikeA', as: 'toggleLikeA'
  delete '/imageAdmin', to: 'image#destroyAdmin', as: 'destroyAdmin'

  resources :user, only: [:index] do
    resources :photos
    resources :albums
    member do
      get :followings, :followers
    end
  end  

  namespace :admin do
    resources :photos, only: [:show, :edit, :destroy, :update]
    resources :albums, only: [:show, :edit, :destroy, :update]
    resources :user, only: [:show, :edit, :destroy, :update]
  end
  
  namespace :guest do 
    get :photos, :albums
  end

  resources :image, only: [:destroy] 
end
