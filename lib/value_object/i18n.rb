require 'i18n'

module ValueObject
  module I18n
    def name_s
      ::I18n.t(self.name, [:value_objects, self.class.name.to_sym])
    end
  end
end
