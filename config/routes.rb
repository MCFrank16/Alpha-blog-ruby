Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles # you can use this method to specify whay you only want to use
  #, only: [:show, :index, :create, :new, :edit, :update]
  get 'signup', to: 'users#new'
  resources :users, expect: [:new]
end
