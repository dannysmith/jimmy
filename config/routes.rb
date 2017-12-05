# frozen_string_literal: true

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  # Debug Routes
  get "/debugger/raise-exception", to: 'debugging#raise_exception'

  root to: 'site#index'
end
