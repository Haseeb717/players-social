Rails.application.routes.draw do
  get 'message/index'

  get 'message/create'

  get 'message/show'

  get 'message/new'

  root 'home#index'
  get 'user/:id' => 'home#user',as: :user
  get 'users' => 'home#users',as: :users
  get 'add_roaster/:id' => 'home#add_roaster', as: :add_roaster
  get 'add_follow/:id' => 'home#add_follow', as: :add_follow
  get 'remove_follow/:id' => 'home#remove_follow', as: :remove_follow
  get 'remove_roaster/:id' => 'home#remove_roaster', as: :remove_roaster
  get 'my_posts' => 'home#my_posts', as: :my_posts
  get 'search' => 'home#search',as: :search
  get 'notifications' => 'home#notifications',as: :notifications

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :players
  resources :posts
  resources :comments

  get 'privacy-policy' => 'home#policy'
  get 'terms' => 'home#terms'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
