Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks do
    collection { post :confirm }
  end
end
