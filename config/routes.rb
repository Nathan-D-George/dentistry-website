Rails.application.routes.draw do
  get    '/new_appointment',     to: 'appointments#new'
  post   '/new_appointment',     to: 'appointments#create'
  delete '/destroy_appointment', to: 'appointments#destroy'

  root 'main#home'
  get 'about', to: 'main#about'

  devise_for :users

  devise_scope :user do
    get "users", to: 'devise/sessions#new'
  end
  
end
