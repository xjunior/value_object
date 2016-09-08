module ValueObject
  # Rubocop wants me to document you
  class Base
    extend ::ValueObject::DSL

    attr_reader :key

    def initialize(key)
      @key = key
    end
  end
end
