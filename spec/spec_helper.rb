require 'rspec/autorun'
require 'dotenv'
Dotenv.load

RSpec.configure do |config|
  config.mock_with :rspec
end
