Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root '/feed', to: 'home#feed'
  get '/discovery', to: 'home#discovery'
  resources :users, excecpt: [:index, :destroy]
  get '/login', to: 'home#login'
  get '/signup', to: 'home#signup'
   resources :admin do 
    resources :users, shallow: true
   end
  
end
