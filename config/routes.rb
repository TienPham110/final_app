Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#feedPhoto'
  get 'signup', to: 'home#signup'
  get 'discovery/photo', to: 'home#disPhoto'
  get 'discovery/album', to: 'home#disAlbum'
  get 'feed/album', to: 'home#feedAlbum', as: "feedAlbum"
  get 'feed/photo', to: 'home#feedPhoto', as: "feedPhoto"
  resources :user do
    resources :photos
    resources :albums
  end
  
  
  
end
