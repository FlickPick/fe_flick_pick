Rails.application.routes.draw do
  resources :users, only: [:create, :show, :new, :update]
end
