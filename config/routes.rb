Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#disPhoto'
  get 'discovery/album', to: 'home#disAlbum'
  get 'feed/album', to: 'home#feedAlbum', as: "feedAlbum"
  get 'feed/photo', to: 'home#feedPhoto', as: "feedPhoto"
  get 'newsest', to: 'home#newsest'
  resources :albums
  resources :user
end
