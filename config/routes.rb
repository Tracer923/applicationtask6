Rails.application.routes.draw do

  root to: "homes#top"
  devise_for :users

  get "home/about"=>"homes#about"
  get "search" => "searches#search"

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
  end
end