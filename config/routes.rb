Rails.application.routes.draw do

  #顧客側
  root to: "public/homes#top"
  namespace :public do
    get "home/about"=>"homes#about"
  end

  #管理者側
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
