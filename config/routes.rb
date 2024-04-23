Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root to: "pages#home"

  resources :items do
    resources :comments, only: [:create]
  end
  resources :collections
  resources :tags, only: [:new, :create, :show]
  resources :members, only: [:new, :create, :show]
  resources :user_suggestions, only: :create
  get 'home', to: 'pages#home'
  post 'mailchimp', to: 'pages#create_mailchimp_member'
end
