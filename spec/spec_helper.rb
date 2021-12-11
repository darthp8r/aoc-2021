require "bundler/setup"

require 'pp'

require "aoc2021"

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each do |support|
  require support
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
