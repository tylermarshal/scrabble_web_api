Rails.application.routes.draw do
  root "welcome#index"

  resources :validates, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        resources :plays, only: [:create]
      end
    end
  end
end
