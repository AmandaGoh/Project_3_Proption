Rails.application.routes.draw do

  #serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  # resources :chatrooms, param: :slug
  # resources :messages

  #test routes for live bidding/action cables
  get 'bidtest/:id', to: 'bidtest#show'
  post 'bidtest', to: 'bidtest#create'

  devise_for :users, :controllers => { :registrations => 'users/registrations'}

  root 'home#index'

  get 'about', to: 'home#about'

  get 'contact', to: 'home#contact'

  resources :properties


  resources :users, only: [:index, :show, :edit, :update]

  resources :listings


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
