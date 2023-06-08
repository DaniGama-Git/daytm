Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root to: "collections#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :items do
    resources :comments, only: [:create]
  end
  resources :collections
  resources :tags, only: [:new, :create]
  resources :members, only: [:new, :create]
  get 'landing', to: 'pages#landing'
end
