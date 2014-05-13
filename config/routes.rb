Epicstories::Application.routes.draw do
  root 'homes#show'

  resources :users, only: [:create, :show]

  resource :session, only: [:destroy]

  resources :stories, only: [:new, :create, :show]
end
