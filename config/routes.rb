Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get '/company/sign_up', to: 'companies/registrations#new', as: :new_company_registration
    post '/company/sign_up', to: 'companies/registrations#create', as: :company_registration
    get '/users/sign_in', to: 'companies/sessions#new', as: :new_company_session
    post '/users/sign_in', to: 'companies/sessions#create', as: :company_session
  end

  
  resources :listings do
    resources :bids, only: %i[ create destroy ] do
      member do
        post :accept
      end
    end
    resources :images, only: [:destroy]
  end

  resources :conversations, only: [:show] do
    resources :messages, only: [:create]
  end

  root "listings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
