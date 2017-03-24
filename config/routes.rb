Rails.application.routes.draw do
  devise_for :users
  resources :imovies
  root 'imovies#index'
end
