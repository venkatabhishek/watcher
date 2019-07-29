require_relative 'boot'

require 'rails/all'
require 'restclient/components'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Watcher
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    RestClient.enable Rack::CommonLogger, STDOUT

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # https://www.viget.com/articles/storing-secret-credentials-in-rails-5-2-and-up/

    config.tmbd_base_url = 'https://api.themoviedb.org/3'
    config.tmbd_image_url = 'https://image.tmdb.org/t/p/'

    config.autoload_paths += %W(#{config.root}/lib/modules)



  end
end
