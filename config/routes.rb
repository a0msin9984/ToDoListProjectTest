Rails.application.routes.draw do
  root "homepage#index"
  resources :tasks, only: [ :index, :create, :update, :destroy ]
  post "/", to: "homepage#create"  # POST /
  get "up" => "rails/health#show", as: :rails_health_check
end
