require 'simplecov'
require 'simplecov-json'

# Configure SimpleCov
SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/test/'
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Views', 'app/views'

  # Enable JSON formatter when COVERAGE_FORMAT=json env variable is set
  if ENV['COVERAGE_FORMAT'] == 'json'
    SimpleCov.formatters = SimpleCov::Formatter::JSONFormatter
  end

  # Track all code coverage changes in PRs
  SimpleCov.at_exit do
    SimpleCov.result.format!
  end
end

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
