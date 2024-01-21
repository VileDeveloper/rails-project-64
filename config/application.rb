# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require_relative '../app/decorators/flash_decorator'

module RailsProject64
  class Application < Rails::Application
    config.app_name = 'Rails Project 64'

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1
    config.autoload_paths += %W[#{Rails.root.join('lib')}]

    config.use_transactional_fixtures = true
    config.use_instantiated_fixtures = false

    config.after_initialize do
      ActionDispatch::Flash::FlashHash.include(FlashDecorator)
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
