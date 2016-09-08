module ValueObject
  module Attribute
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def value_attribute(attr_name, klass)
        id_attr = "#{attr_name}_id"

        define_method attr_name do
          klass.find self.public_send(id_attr)
        end

        define_method "#{attr_name}=" do |obj|
          self.public_send("#{id_attr}=", obj.key)
        end
      end
    end
  end
end
