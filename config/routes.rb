Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get  'homes/home' => 'homes#home'
  resources :testsessions, only: [:create]
  resources :users, only: [:index, :update, :show, :edit]
  get 'homes/shelf' => 'homes#shelf'
  get 'homes/like' => 'homes#like_shelf'
  resources :recipes do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :genres, only: [:index, :update, :create, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
