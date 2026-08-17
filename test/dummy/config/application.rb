require File.expand_path('../boot', __FILE__)

# Metamagic only touches the view layer, so the dummy app boots just the
# frameworks the test suite actually needs instead of `rails/all`. This keeps
# Active Record (and a database) out of the picture entirely.
require 'rails'
require 'action_controller/railtie'
require 'action_view/railtie'

Bundler.require(*Rails.groups)
require "metamagic"

module Dummy
  class Application < Rails::Application
    config.load_defaults 8.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
