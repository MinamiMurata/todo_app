Rails.application.routes.draw do
  get "sessions/new"
  root "tasks#index"
  resources :tasks do
    collection { post :confirm }
  end
  resources :sessions, only: %i[new create destroy]
  resources :users, only: %i[new create show]

  namespace :admin do
    resources :users
  end
end
