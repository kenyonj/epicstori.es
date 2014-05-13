require File.expand_path('../boot', __FILE__)
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Epicstories
  class Application < Rails::Application
    config.generators do |g|
      g.factory_girl false
    end
  end
end
