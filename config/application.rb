require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Joberani
  class Application < Rails::Application

    config.load_defaults 5.1
    # 日本語化
    config.i18n.default_locale = :ja
    
    # タイムゾーンを日本に設定
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

  end
end
