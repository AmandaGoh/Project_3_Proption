Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  get 'about', to: 'home#about'

  get 'contact', to: 'home#contact'

  resources :properties

  resources :users, only: [:index, :show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
