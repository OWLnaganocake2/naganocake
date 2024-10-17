Rails.application.routes.draw do
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end

  scope module: :public do
    resources :items, only: [:index, :show]
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
  end

  devise_for :customers,controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }

  devise_for :admin,skip: [:registrations,:passwords], controllers: {
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
