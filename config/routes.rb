Rails.application.routes.draw do
  get 'profiles/show'

  get 'profiles/edit'

  get 'profiles/update'

  get 'profiles/create'

  get 'profiles/new'

  get 'users/sign_out', to: 'pages#home'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles, only: [:show, :edit, :update, :create, :new]

  resources :yurts do
    resources :bookings, only: [:create, :new]
    resources :timeslots
    resources :reviews, only: [:show, :index]
  end

  resources :bookings, only: [:show, :index] do
    resources :reviews, only: [:create, :new]
  end

end

