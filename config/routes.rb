Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks do
    collection { post :confirm }
  end
  resources :sessions, only: %i[new create destroy]
  resources :users, only: %i[new create show]
  namespace :admin do
    resources :users
    resources :labels, except: :show
  end
end
