# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:primary_email) }
  it { should validate_presence_of(:name) }

  it { should validate_exclusion_of(:username).in_array(%w[admin superuser administrator root jimmy]) }
  it { should validate_length_of(:name).is_at_most(300) }
end
