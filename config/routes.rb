Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  resources :users, only: [:show, :new, :create]
  resources :parties, only: [:show, :new, :create]
  resources :sessions, only: [:create, :new, :destroy]
  resources :temp_users, only: [:create]
  get "/temp_users/:id/picks/waiting_room", to: "picks#waiting_room"
end