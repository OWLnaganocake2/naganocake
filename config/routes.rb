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
    resources :items, only: [:index,:new]
  end
  
end
