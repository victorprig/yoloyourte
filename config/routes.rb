Rails.application.routes.draw do

  get 'timeslots/show'

  get 'timeslots/edit'

  get 'timeslots/update'

  get 'timeslots/create'

  get 'timeslots/new'

  get 'timeslots/destroy'

  get 'timeslots/index'

  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'yurts/index_all', to: 'yurts#index_all'

  resources :profiles, only: [:show, :edit, :update, :create, :new]

  resources :yurts do
    resources :bookings, only: [:create, :new]
    resources :timeslots
    resources :reviews, only: [:show, :index]
  end

  resources :bookings, only: [:show, :index, :destroy] do
    resources :reviews, only: [:create, :new]
  end

end


