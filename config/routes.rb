Rails.application.routes.draw do
  get  '/list_of_apps',       to: 'appointments#list'
  get  '/new_appointment',    to: 'appointments#new'
  post '/new_appointment',    to: 'appointments#create'
  post '/cancel_appointment', to: 'appointments#cancel'

  root 'main#home'
  get 'about', to: 'main#about'

  devise_for :users

  devise_scope :user do
    get "users", to: 'devise/sessions#new'
  end
  
end

=begin
  
    AREAS FOR EXPANSION ON THIS WEBSITE

    1. make that people can cancel their appointments unless it is within 24 hours

    2. include an actual map extension to see location

    3. 
  
=end