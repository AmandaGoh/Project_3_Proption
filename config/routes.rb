Rails.application.routes.draw do

  #serve websocket cable requests in-process
  mount ActionCable.server => '/cable'


  devise_for :users, :controllers => { :registrations => 'users/registrations'}

  root 'home#index'

  get 'bidder_bid_history', to: 'bids#bidder_bid_history'

  get 'seller_bid_history', to: 'bids#seller_bid_history'

  get 'accept_bid', to: 'listings#accept_bid'

  get 'about', to: 'home#about'

  get 'contact', to: 'home#contact'


  get 'mylistings', to: 'listings#mylistings'
# page for individual properties
  get 'myproperties', to: 'properties#myproperties'

  # get 'propertydetails', to: "properties#propertydetails"

  resources :properties

  resources :users, only: [:index, :show, :edit, :update]

#nested routes for listings/bids
  resources :listings

  post '/listings/:id/bids', to: 'bids#create'

#nested routes to edit properties' listed status

  post '/properties/:id/edit', to: 'properties#update_listed_status'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
