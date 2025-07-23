Rails.application.routes.draw do
  devise_for :users

  resources :events
  resources :attendances, only: [:new, :create]

  root "events#index"
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  
end

