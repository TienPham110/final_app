Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#feed'
  get 'home/discovery', to: 'home#discovery'
  get 'newsest', to: 'home#newsest'
  resources :albums
  resources :user
end
