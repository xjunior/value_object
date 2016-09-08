module ValueObject
  class Base
    attr_reader :key
 
    def initialize(key)
      @key = key
    end

    class << self
      def find(key)
        return unless key
        all.find {|v| v.key.to_s.eql?(key.to_s)} || raise(ValueObject::InvalidValue, "#{self.to_s} #{key} not found")
      end

      attr_accessor :all

      protected

      def value(key, *args)
        object = new(key, *args)
        define_value_getter object

        @all ||= []
        @all << object
      end

      def define_value_getter(object)
        define_singleton_method(object.key) { object }
      end
    end
  end
end
