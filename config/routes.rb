Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :prototypes, only: [:index, :new, :create, :show, :destroy]do
    resources :comments, only: [:create, :destroy]
  end
  #destory を追加(岡)
  resources :users, only: [:show, :edit, :update]

end
