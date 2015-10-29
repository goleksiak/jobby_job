Rails.application.routes.draw do

  namespace :admin do
    resources :jobs, only: [:edit]
  end

  resources :submissions, only: [:new, :create]
  resources :jobs, only: [:index, :show]

  root to: 'jobs#index'
end
