Rails.application.routes.draw do
  get  '/list_of_apps',       to: 'appointments#list'
  get  '/new_appointment',    to: 'appointments#new'
  post '/new_appointment',    to: 'appointments#create'
  post '/cancel_appointment', to: 'appointments#cancel'
  

  root 'main#home'
  get 'about', to: 'main#about'
  get '/show_employees', to: 'main#show_employees'

  devise_for :users

  devise_scope :user do
    get "users", to: 'devise/sessions#new'
  end
  
end