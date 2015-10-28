Rails.application.routes.draw do

  resources :jobs, only: [:index]

  root to: 'jobs#index'
end
