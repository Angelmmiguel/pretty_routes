# Configure Rails Envinronment
ENV['RAILS_ENV'] = 'test'
require 'pry'

ENGINE_RAILS_ROOT = File.join(File.dirname(__FILE__), '../')
require File.expand_path('../dummy/config/environment.rb', __FILE__)
require 'rails/test_help'

Rails.backtrace_cleaner.remove_silencers!

# Configure capybara for integration testing
require 'capybara/rails'
require 'capybara/poltergeist'
Capybara.current_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
Capybara.default_selector = :css

# Run any available migration
ActiveRecord::Migrator.migrate(
  File.expand_path('../dummy/db/migrate/', __FILE__))

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Force DSL inclusion
class ActionDispatch::IntegrationCase
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
end
