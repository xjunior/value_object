require 'spec_helper'

describe ValueObject do
  it 'has a version number' do
    expect(ValueObject::VERSION).not_to be nil
  end
end
