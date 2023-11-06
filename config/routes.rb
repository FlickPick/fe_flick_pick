Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  resources :users, only: [:show, :new, :create]
  resources :parties, only: [:show, :new, :create]
  resources :sessions, only: [:create, :new, :destroy]
  resources :temp_users, only: [:create] do
    resources :selections, only: :index
  end
  get "/temp_users/:id/selections/waiting_room", to: "selections#waiting_room"
end