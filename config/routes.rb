Rails.application.routes.draw do
  root "welcome#index"

  resources :validates, only: [:index]
end
