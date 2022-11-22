Rails.application.routes.draw do
  resources :styles
  resources :memberships
  resources :beer_clubs
  resources :users
  resources :beers
  resources :breweries

  resources :breweries do
    post 'toggle_activity', on: :member
  end

  resources :ratings, only: [:index, :new, :create, :destroy]

  root 'breweries#index'
  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  delete 'sign-out', to: 'sessions#destroy'

  resource :session, only: [:index, :new, :create, :destroy]

  resources :places, only: [:index, :new]
  post 'places', to: 'places#search'



end