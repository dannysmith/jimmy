# frozen_string_literal: true

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get '/dashboard', to: 'dashboard#index'

  #############################################################
  ###                   USER AND SESSIONS                   ###
  #############################################################

  # Users
  resources :users, except: %i[index new]
  get '/signup', to: 'users#new'

  # Sessions
  get '/login',  to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  #############################################################
  ###                      PUBLIC SITE                      ###
  #############################################################
  root to: 'site#index'
end
