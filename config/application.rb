require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RNT
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths += %W[#{Rails.root}/lib] #add the route of randomnumber file,make the randomnumber methods work

    config.generators do |generator|
      generator.assets false
      generator.test_framework false
      generator.skip_routes true
  end
  end
  end
