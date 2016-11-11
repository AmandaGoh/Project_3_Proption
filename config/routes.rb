Rails.application.routes.draw do

  #serve websocket cable requests in-process
  mount ActionCable.server => '/cable'


  devise_for :users, :controllers => { :registrations => 'users/registrations'}

  root 'home#index'

  get 'about', to: 'home#about'

  get 'contact', to: 'home#contact'

  resources :properties


  resources :users, only: [:index, :show, :edit, :update]

#nested routes for listings/bids
  resources :listings do
    resources :bids
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
