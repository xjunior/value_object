require 'spec_helper'
require 'value_object/i18n'

describe ValueObject::I18n do
  class HairColor < ValueObject::Base
    include ValueObject::I18n

    value :black
  end

  describe '.name_s' do
    it 'is the translation of the value name in the value_object context' do
      expect(I18n).to receive(:t).with(:black, scope: [:value_objects, :HairColor], default: :black).and_return('preto')

      expect(HairColor.black.name_s).to eql 'preto'
    end
  end
end
