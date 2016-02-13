require File.expand_path('../boot', __FILE__)

# Require
require 'rails/all'
Bundler.require(*Rails.groups)
require 'pretty_routes'

module Dummy
  # Main application class
  class Application < Rails::Application
    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = 'utf-8'
    config.assets.enabled = true
    config.assets.version = '1.0'
  end
end
