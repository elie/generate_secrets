# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'generate_secrets/version'

Gem::Specification.new do |spec|
  spec.name          = "generate_secrets"
  spec.version       = GenerateSecrets::VERSION
  spec.authors       = ["Elie Schoppik"]
  spec.email         = ["eschoppik@gmail.com"]

  spec.summary       = %q{Generate a secrets.yml file if you are using an app that has gitignore-d it}
  spec.homepage      = "https://github.com/elie/generate_secrets"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "rails"         , "~> 4.2.2"
  spec.add_development_dependency "rspec"
end
