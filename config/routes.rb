Rails.application.routes.draw do
  devise_for :users

  resources :events
  resources :attendances, only: [:new, :create]

  root "events#index"
end
