Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'homes#home'
  get'home/about' => 'homes#about'
  resources :books, only: [:new, :index, :show,:destroy,:create, :edit, :update]
  resources :users, only: [:show, :index, :edit, :update]
end
