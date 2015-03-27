require File.expand_path('../boot', __FILE__)

# require 'rails/all'
# Pick the frameworks you want:
# require 'active_model/railtie'
require 'active_record/railtie'
# require 'action_controller/railtie'
require 'action_mailer/railtie'
# require 'active_job/railtie'
# require 'action_view/railtie'
require 'sprockets/railtie' # For Swagger UI
# require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WhaleApi
  class Application < Rails::Application
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
      end
    end
  end
end
