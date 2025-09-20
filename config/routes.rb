Rails.application.routes.draw do
  resources :contas
  resources :tipo_contas
  resources :conta_pagamentos, only: [:edit, :update]
  resources :contas do
    collection do
      post :atualiza
    end
  end

  get '/consulta', to: 'conta_pagamentos#consulta', as: :consulta_conta_pagamento

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "contas#index"
end
