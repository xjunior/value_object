module ValueObject
  class InvalidValue < defined?(ActiveRecord::RecordNotFound) ? ActiveRecord::RecordNotFound : StandardError
  end
end
