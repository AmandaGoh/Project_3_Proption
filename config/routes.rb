Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'users/registrations'}


  root 'home#index'

  get 'about', to: 'home#about'

  get 'contact', to: 'home#contact'


  get 'mylistings', to: 'listings#mylistings'
# page for individual properties
  get 'myproperties', to: 'properties#myproperties'

  # get 'propertydetails', to: "properties#propertydetails"

  resources :properties

  resources :users, only: [:index, :show, :edit, :update]

  resources :listings


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
