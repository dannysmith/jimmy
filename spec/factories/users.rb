# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username 'joebloggs'
    primary_email 'jo2_bloggs@example.com'
    name 'Joe H. Bloggs'
    password 'password12345'
  end
end
