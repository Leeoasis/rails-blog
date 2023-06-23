require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

module RailsBlog
  class Application < Rails::Application
    config.load_defaults 7.0

    # Add other middleware configurations here
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    config.middleware.use ActionDispatch::Flash

    # Set JSON as the default API format
    config.api_only = true
    config.debug_exception_response_format = :api

    # Configuration for the application, engines, and railties goes here.
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
