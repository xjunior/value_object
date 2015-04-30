require 'spec_helper'

describe ValueObject::I18n do
  class HairColor < ValueObject::Base
    include ValueObject::I18n

    value :black, 1
  end

  describe '.name_s' do
    it 'is the translation of the value name in the value_object context' do
      expect(I18n).to receive(:t).with(:black, [:value_objects, :HairColor]).and_return('preto')

      expect(HairColor.black.name_s).to eql 'preto'
    end
  end
end
