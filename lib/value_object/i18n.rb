require 'i18n'

module ValueObject
  module I18n
    def name_s
      ::I18n.t(self.key, scope: [:value_objects, self.class.name.to_sym], default: self.key)
    end
  end
end
