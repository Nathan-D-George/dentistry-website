Rails.application.routes.draw do
  root 'main#home'
  get 'about', to: 'main#about'

  devise_for :users

  devise_scope :user do
    get "users", to: 'devise/sessions#new'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
