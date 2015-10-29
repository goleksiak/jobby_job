Rails.application.routes.draw do

  resources :submissions, only: [:new, :create]
  resources :jobs, only: [:index, :show]

  root to: 'jobs#index'
end
