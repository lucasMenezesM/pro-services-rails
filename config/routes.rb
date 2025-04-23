Rails.application.routes.draw do
  resources :service_requests do
    collection do
    end
  end
  
  resources :services
  resources :service_categories
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "pages#home"

  # SERVICE REQUESTS PAGES
  get 'my_requests', to: 'service_requests#my_requests', as: 'my_requests'
  get 'open_requests', to: 'service_requests#open_requests', as: 'open_requests'
  get 'closed_requests', to: 'service_requests#closed_requests', as: 'closed_requests'
  get 'cancelled_requests', to: 'service_requests#cancelled_requests', as: 'cancelled_requests'
  get 'in_progress_requests', to: 'service_requests#in_progress_requests', as: 'in_progress_requests'
  get 'available_requests', to: 'service_requests#available_requests', as: 'available_requests'
end
