# frozen_string_literal: true

require 'sidekiq/web'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get '/dashboard', to: 'dashboard#index'

  #############################################################
  ###                   USER AND SESSIONS                   ###
  #############################################################

  # Devise
  devise_for :users

  #############################################################
  ###                      PUBLIC SITE                      ###
  #############################################################
  root to: 'site#index'

  #############################################################
  ###                       ADMIN SITE                      ###
  #############################################################

  # TODO: Scope these to admin users once devise is installed.
  # authenticate :user, -> (user) { user.admin? } do
  mount PgHero::Engine, at: 'admin/pghero'
  mount Sidekiq::Web, at: 'admin/sidekiq'
  # end
end
