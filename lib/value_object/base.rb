module ValueObject
  class Base < Struct.new(:name, :id)
    class << self
      def find(id)
        return unless id
        all.find {|v| v.id.to_s.eql?(id.to_s)} || raise(ValueObject::InvalidValue, "#{self.name} with id #{id} not found")
      end

      attr_accessor :all

      protected

      def value(name, id, *args)
        object = new(name, id, *args)
        define_value_getter object

        @all ||= []
        @all << object
      end

      def define_value_getter(object)
        define_singleton_method(object.name) { object }
      end
    end
  end
end
