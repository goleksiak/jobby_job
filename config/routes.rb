Rails.application.routes.draw do

  resources :jobs, only: [:index, :show]

  root to: 'jobs#index'
end
