Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'users/registrations'}


  root 'home#index'

  get 'about', to: 'home#about'

  get 'contact', to: 'home#contact'

  get 'myproperties', to: 'properties#myproperties'

  get 'mylistings', to: 'listings#mylistings'

  resources :properties

  resources :users, only: [:index, :show, :edit, :update]

  resources :listings


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
