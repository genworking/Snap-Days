require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module InstaClone5
  class Application < Rails::Application
    config.load_defaults 5.2
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
    config.generators do |g|
      g.test_framework :rspec,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        request_specs: true
    end
  end
end
