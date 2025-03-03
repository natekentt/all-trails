Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :reviews, only: [:create, :destroy]
      #resources :trail_images
      resources :trails, param: :slug
      resources :users
    end
  end

  # once we use react router, it allows us to handle routing to our react component
  # without messing up ruby api routing
  get '*path', to: 'pages#index', via: :all

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  
end
