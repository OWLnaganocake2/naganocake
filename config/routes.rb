Rails.application.routes.draw do

  #顧客側
  scope module: :public do
    root to: "homes#top"
    get "about", to:"homes#about"
  end

  #管理者側
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
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
