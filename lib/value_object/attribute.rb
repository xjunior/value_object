module ValueObject
  module Attribute
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def value_attribute(name, klass)
        id_attr = "#{name}_id"

        define_method name do
          klass.find self.public_send(id_attr)
        end

        define_method "#{name}=" do |obj|
          self.public_send("#{id_attr}=", obj.id)
        end
      end
    end
  end
end
