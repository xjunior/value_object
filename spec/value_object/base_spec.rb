require 'spec_helper'

describe ValueObject::Base do
  class Example < ValueObject::Base
    value :name1
    value :name2
    value :name3
  end

  describe 'value methods' do
    it 'defines a method for each value' do
      expect(Example.name1.key).to be :name1
    end
  end

  describe '#all' do
    it 'has all values' do
      expect(Example.all).to match_array [Example.name1, Example.name2, Example.name3]
    end
  end

  describe '#find' do
    it 'returns the val object by key' do
      expect(Example.find(Example.name1.key)).to be Example.name1
    end

    it 'raises a comprehansible exception when the value is invalid' do
      expect { Example.find(:name10) }.to raise_error ValueObject::InvalidValue, 'Example name10 not found'
    end
  end
end
