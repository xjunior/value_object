require 'spec_helper'

describe ValueObject::Attribute do
  class EyeColor <  ValueObject::Base
    value :dark_brown
    value :green
    value :blue
  end

  class Person
    include ValueObject::Attribute

    attr_accessor :eye_color_id

    value_attribute :eye_color, EyeColor
  end

  subject { Person.new }

  describe 'object setter' do
    it 'sets the id field' do
      subject.eye_color = EyeColor.dark_brown

      expect(subject.eye_color_id).to eql EyeColor.dark_brown.key
    end
  end

  describe 'object getter' do
    it 'will get the value pointed by the id field' do
      subject.eye_color_id = EyeColor.blue.key

      expect(subject.eye_color).to be EyeColor.blue
    end

    it 'will raise an error if the id is invalid' do
      subject.eye_color_id = 'yellow'

      expect { subject.eye_color }.to raise_error ValueObject::InvalidValue, 'EyeColor yellow not found'
    end
  end
end
