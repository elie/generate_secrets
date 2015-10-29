require 'rails/generators/base'
require_relative "../generate_secrets"

class SecretsGenerator < Rails::Generators::Base
  include GenerateSecrets
  def create_secrets_file
    generate_keys
  end
end
