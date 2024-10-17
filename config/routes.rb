Rails.application.routes.draw do
  devise_for :customers,controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }
  
  devise_for :admin,skip: [:registrations,:passwords], controllers: {
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :admin do
     root 'home#top'
    resources :items, only: [:index,:new,:edit,:show,:create,:update]
    resources :genres, only: [:index,:create,:edit,:update]
    resources :customers, only: [:index,:show,:edit,:update]
    resources :orders, only: [:show,:update]
    resources :order_details, only: [:update]
    
  end
  
end
