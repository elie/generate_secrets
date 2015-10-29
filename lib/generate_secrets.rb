require 'rake'
require 'securerandom'

module GenerateSecrets
  def generate_keys
    development_key = SecureRandom.hex(64)
    test_key = SecureRandom.hex(64)
    array_of_keys = [{
      development: {
        secret_key_base: development_key
      },
      test:{
        secret_key_base: test_key
      },
      production:{
        secret_key_base: '<%= ENV["SECRET_KEY_BASE"] %>'
      }
    }]
    File.open("config/secrets.yml", 'w+') {|f| f.write(array_of_keys.to_yaml.gsub("---\n", '').gsub(/\s{0,1}\ :/, '').gsub("-", '')) }
  end
end