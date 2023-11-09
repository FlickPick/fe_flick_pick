Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  resources :users, only: [:show, :new, :create]
  resources :parties, only: [:show, :new, :create]
  resources :sessions, only: [:create, :new]
  resources :temp_users, only: [:create] do
    resources :selections, only: :index
  end

  get "/parties/:id/patch", to: "parties#patch"
  get "/parties/:id/details", to: "parties#details"
  get "/sessions/:id", to: "sessions#destroy"
  get "/temp_users/:id/selections/waiting_room", to: "selections#waiting_room"
  get "/temp_users/:id/selections/results", to: "selections#results"
  get "/temp_users/:id/liked_movies/next", to: "liked_movies#next"
  post "/temp_users/:id/liked_movies/create", to: "liked_movies#create"
  get "/parties/:party_id/selections/results", to: "selections#results", as: "results"
  get '/auth/github/callback', to: 'sessions#create_github'
end