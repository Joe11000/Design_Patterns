require_relative 'spec_helper'
require_relative '../lib/government'

describe 'Logger' do
  # include FakeFS::SpecHelpers
  it 'returns only 1 instance' do
    expect(Government.instance).to equal Government.instance
  end

end
