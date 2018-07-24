# frozen_string_literal: true

require 'sidekiq/web'
require_relative '../app/models/route_constraints/admin.rb'

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

  # OAuth
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')

  #############################################################
  ###                      PUBLIC SITE                      ###
  #############################################################
  root to: 'site#index'

  #############################################################
  ###                       ADMIN SITE                      ###
  #############################################################

  namespace :admin, constraints: RouteConstraint::Admin.new do
    mount PgHero::Engine, at: 'pghero'
    mount Sidekiq::Web, at: 'sidekiq'
  end
end
