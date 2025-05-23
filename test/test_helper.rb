require "simplecov"
require "simplecov-json"

# Configure SimpleCov
SimpleCov.start "rails" do
  add_filter "/bin/"
  add_filter "/db/"
  add_filter "/test/"
  add_filter "db/schema.rb"  # Explicitly exclude schema.rb
  add_filter "db/migrate"  # Exclude all migration files
  add_filter "config/routes.rb"  # Exclude routes.rb
  add_filter "test/test_helper.rb"  # Explicitly exclude test_helper.rb
  add_group "Controllers", "app/controllers"
  add_group "Models", "app/models"
  add_group "Views", "app/views"

  # Enable JSON formatter when COVERAGE_FORMAT=json env variable is set
  if ENV["COVERAGE_FORMAT"] == "json"
    # Use both HTML and JSON formatters
    SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
      SimpleCov::Formatter::HTMLFormatter,
      SimpleCov::Formatter::JSONFormatter
    ])
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
