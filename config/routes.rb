Rails.application.routes.draw do
  devise_for :users
  resources :imovies do
    resources :reviews
  end
  root 'imovies#index'
end
