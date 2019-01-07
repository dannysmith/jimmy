# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Current, type: :model do
  subject { Current } # Test the class, not the instance.

  after(:each) do
    Current.reset
  end

  context 'Exposes the correct Request data' do
    it { is_expected.to respond_to(:request_id) }
    it { is_expected.to respond_to(:user_agent) }
    it { is_expected.to respond_to(:ip_address) }
    it { is_expected.to respond_to(:user) }
    it { is_expected.to respond_to(:context) }
  end

  context 'Stores context' do
    it 'Initializes and adds context data correctly' do
      subject.ctx('Line 1')
      subject.ctx('Line 2')
      expect(subject.context).to eq ['Line 1', 'Line 2']
    end
  end

  it 'Returns request details as an object' do
    ua = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 ' \
         '(KHTML, like Gecko) Chrome/69.0.3497.23 Safari/537.36'
    expected_result = {
      request_id: 'cff6c0bc-37fe-40fe-8eb1-a2c5e738a1c6',
      user_agent: ua,
      ip_address: '127.0.0.1',
      user_id: 123,
      context: ['Line 1']
    }
    subject.request_id = 'cff6c0bc-37fe-40fe-8eb1-a2c5e738a1c6'
    subject.user_agent = ua
    subject.ip_address = '127.0.0.1'
    subject.user = double('User', id: 123)
    subject.ctx('Line 1')

    expect(subject.request_details).to eq expected_result
  end
end
