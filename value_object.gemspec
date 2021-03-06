# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'value_object/version'

Gem::Specification.new do |spec|
  spec.name          = "value_object-ruby"
  spec.version       = ValueObject::VERSION
  spec.authors       = ["Carlos Palhares"]
  spec.email         = ["me@xjunior.me"]

  spec.summary       = %q{ValueObjects compliant with most ruby ORM}
  spec.description   = %q{ValueObjects compliant with most ruby ORM, allowing a class to have a relation with a value object in similarly to any other relation}
  spec.homepage      = "http://github.com/xjunior/value_object"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0.10"
end
