# frozen_string_literal: true

describe Jimmy::Error do
  let(:error_without_severity) { Jimmy::Error.new('This is an Error') }
  let(:error_with_severity) { Jimmy::Error.new('This is a Warning', :warn, data: 'Some metadata') }

  it 'should be a type of error, and expose the message' do
    expect(error_without_severity).to be_a StandardError
    expect(error_without_severity.message).to eq('This is an Error')
  end

  it 'should set a default severity' do
    expect(error_without_severity.severity).to eq(:error)
  end

  it 'should expose metadata as a hash' do
    expect(error_with_severity.metadata).to eq(data: 'Some metadata')
  end

  it 'should respect a custom severity' do
    expect(error_with_severity.severity).to eq(:warn)
  end
end
