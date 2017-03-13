Rails.application.routes.draw do

  root 'welcome#home'
  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'
  resources :sessions, only: [:create]
  resources :users, only: [:new, :create, :show, :destroy]
  resources :attractions
  resources :rides, only: [:create]

end