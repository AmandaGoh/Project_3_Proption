Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users/registrations'}

  as :user do
    
  end

  root 'home#index'

  get 'about', to: 'home#about'

  get 'contact', to: 'home#contact'

  resources :properties

  resources :listings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
