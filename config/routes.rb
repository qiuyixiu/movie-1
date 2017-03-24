Rails.application.routes.draw do
  devise_for :users
  resources :imovies do
    member do
      post :join
      post :quit
    end
    resources :reviews
  end

  namespace :account do
    resources :imovies
    resources :reviews
  end


  root 'imovies#index'
end
