Rails.application.routes.draw do
  
  #顧客側
  scope module: :public do
    root to: "homes#top"
    get "about", to:"homes#about"
    resources :items, only: [:index, :show]
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :addresses, only: [:index, :create, :destroy, :edit, :update]
    

  #   resources :customers do
  #   resources :cart_items, only: [:update,:destroy,:index,:create] 
  # end
    
    
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
    resources :cart_items, only: [:index, :update, :destroy, :create] 

  end

  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end

  devise_for :customers,controllers: {
  sessions: 'public/sessions',
  registrations: 'public/registrations'
  }

  devise_for :admin,skip: [:registrations,:passwords], controllers: {
  sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #管理者側
  namespace :admin do
    get "/" => 'home#top'
    resources :items, only: [:index,:new,:edit,:show,:create,:update]
    resources :genres, only: [:index,:create,:edit,:update]
    resources :customers, only: [:index,:show,:edit,:update]
    resources :orders, only: [:show,:update]
    resources :order_details, only: [:update]
  end

end
