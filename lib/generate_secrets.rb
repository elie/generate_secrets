require 'rake'

module GenerateSecrets
  def generate_keys
    app = Rake.application
    app.init
    app.load_rakefile
    development_key = app['secret'].invoke[0].call
    app['secret'].reenable
    test_key = app['secret'].invoke[0].call
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
    array_of_keys
  end

  def generate_file
    File.open("config/secrets.yml", 'w+') {|f| f.write(generate_keys.to_yaml.gsub("---\n", '').gsub(/\s{0,1}\ :/, '').gsub("-", '')) }
  end
end