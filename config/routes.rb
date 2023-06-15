Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :items do
    resources :comments, only: [:create]
  end
  resources :collections
  resources :tags, only: [:new, :create, :show]
  resources :members, only: [:new, :create]
  resources :user_suggestions, only: :create
  get 'home', to: 'pages#home'
end
