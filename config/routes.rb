Epicstories::Application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  root 'homes#show'

  resources :users, only: [:create, :show]

  resource :session, only: [:create, :destroy]

  resources :stories, only: [:new, :create, :show]
end
