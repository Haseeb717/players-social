Rails.application.routes.draw do
  root 'home#index'
  get 'user/:id' => 'home#user',as: :user
  get 'users' => 'home#users',as: :users
  get 'add_roaster/:id' => 'home#add_roaster', as: :add_roaster
  get 'add_follow/:id' => 'home#add_follow', as: :add_follow

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :players
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
