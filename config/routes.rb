Rails.application.routes.draw do

  get 'bids/index'

  get 'bids/new'

 devise_for :users

 root 'home#index'

 get 'about', to: 'home#about'

 get 'contact', to: 'home#contact'

 resources :properties


 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
