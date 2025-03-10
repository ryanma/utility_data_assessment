Rails.application.routes.draw do
  root "queries#index"
  resources :queries, except: [ :edit, :update ]

  get "up" => "rails/health#show", as: :rails_health_check
end
