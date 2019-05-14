Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :posts
  get '/services', to: 'services#index'
  get '/references', to: 'references#index'
  get '/contact', to: 'contact#index'
  get '/about', to: 'about#index'

  root 'posts#index'
end
