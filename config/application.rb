require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module InstaClone5
  class Application < Rails::Application
    config.load_defaults 5.2
    config.i18n.default_locale = :ja

    config.time_zone = 'Tokyo'
    config.generators.test_framework = :rspec# モデル、コントローラー作成時、ファイル自動作成
    config.generators.system_tests   = false
    config.generators.stylesheets    = false
    config.generators.javascripts    = false
    config.generators.helper         = false
  end
end
