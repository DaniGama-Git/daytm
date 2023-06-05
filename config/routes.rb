Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :items
  resources :collections, except: [:index]
  resources :tags, only: [:new, :create]
  resources :members, only: [:new, :create]
  get 'landing', to: 'pages#landing'
end
