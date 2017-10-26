  require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module News
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.assets.initialize_on_precompile = false
    # config.force_ssl = true
    # config.paths['app/views']
    # Koala.config.api_version = 'v2.10'
    # config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    # config.assets.precompile += %w[*.png *.jpg *.jpeg *.gif]
    config.eager_load_paths << Rails.root.join("lib/cookie_news")
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
