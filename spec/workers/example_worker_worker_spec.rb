# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExampleWorker, type: :worker do
  describe '#perform' do
    let(:worker) { subject }

    # This is the purpose of the example worker. It creates a new user.
    it 'creates a new user' do
      # Run the worker by calling `perform` on it.
      worker.perform('Mister ExampleWorker Test', 'jane@example.com')

      # Verify that the worker did what it was supposed to
      user = User.where(name: 'Mister ExampleWorker Test').last
      expect(user).not_to be_nil
      expect(user.primary_email).not_to be_nil
    end
  end
end
