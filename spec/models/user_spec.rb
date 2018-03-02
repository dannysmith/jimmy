# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:primary_email) }
    it { should validate_presence_of(:name) }

    it { should validate_exclusion_of(:username).in_array(%w[admin superuser administrator root jimmy]) }
    it { should validate_length_of(:name).is_at_most(300) }
  end

  context 'Instance methods' do
    let(:user) { create(:user) }

    it 'Returns metadata as a key symbolized hash' do
      user.metadata = {'note' => 'some note', 'some_flag' => true}
      user.save!
      expect(user.metadata.key?(:note)).to be true
      expect(user.metadata.key?(:some_flag)).to be true

      # hstore always returns values as trings
      expect(user.metadata[:some_flag]).to eq 'true'
    end
  end
end
