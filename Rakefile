require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

# From https://github.com/rails/rails/blob/7f18ea14c893cb5c9f04d4fda9661126758332b5/railties/lib/rails/tasks/misc.rake
desc 'Generate a cryptographically secure secret key (this is typically used to generate a secret for cookie sessions).'
task :secret do
  require 'securerandom'
  SecureRandom.hex(64)
end