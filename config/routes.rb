Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#feed'
  resources :admin, only: [:show]  do
    resources :user ,shallow: true
  end
  get 'newsest', to: 'home#newsest'
  
end
