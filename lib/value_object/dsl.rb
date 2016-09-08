module ValueObject
  module DSL
    def find(key)
      return unless key
      object = all.find { |v| v.key.to_s.eql?(key.to_s) }
      object || raise_invalid_value(key)
    end

    attr_accessor :all

    protected

    def value(*args)
      object = new(*args)
      define_value_getter object

      @all ||= []
      @all << object
    end

    private

    def define_value_getter(object)
      define_singleton_method(object.key) { object }
    end

    def raise_invalid_value(key)
      raise(ValueObject::InvalidValue, "#{self} #{key} not found")
    end
  end
end
