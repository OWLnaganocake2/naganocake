Rails.application.routes.draw do
  scope module: :public do
    resources :items, only: [:index, :show]
  end

  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
