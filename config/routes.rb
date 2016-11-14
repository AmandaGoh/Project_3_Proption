Rails.application.routes.draw do

  #serve websocket cable requests in-process
  mount ActionCable.server => '/cable'


  devise_for :users, :controllers => { :registrations => 'users/registrations'}

  root 'home#index'

  get 'bids', to: 'bids#index'

  get 'bid_history', to: 'bids#history'


  get 'about', to: 'home#about'

  get 'contact', to: 'home#contact'


  get 'mylistings', to: 'listings#mylistings'
# page for individual properties
  get 'myproperties', to: 'properties#myproperties'

  get 'propertydetails', to: "properties#propertydetails"

  resources :properties

  resources :users, only: [:index, :show, :edit, :update]

#nested routes for listings/bids
  resources :listings

  post '/listings/:id/bids', to: "bids#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
