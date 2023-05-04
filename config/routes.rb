Rails.application.routes.draw do

  root to: "homes#top"
  devise_for :users

  get "home/about"=>"homes#about"
  resources :users, only: [:index, :show, :edit, :update]

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
  end
end