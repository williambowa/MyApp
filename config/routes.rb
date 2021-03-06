Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  #overiding the path of the show action of portfolio resource 
  resources :portfolios, expect: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :blogs

  resources :achievements, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home'
end
