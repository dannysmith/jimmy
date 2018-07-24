# frozen_string_literal: true

options = { scope: 'user:email' }

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, Rails.application.credentials.dig(:github, :client_id),
                    Rails.application.credentials.dig(:github, :client_secret),
                    options
end