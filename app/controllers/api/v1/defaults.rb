module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        version 'v1', using: :path
        default_format :json
        format :json

        helpers do
          def permitted_params
            @permitted_params ||= declared(params, include_missing: false)
          end

          def logger
            Rails.logger
          end

          def warden
            env['warden']
          end

          def authenticate!
            error!('401 Unauthorized', 401) unless authenticated
          end

          def authenticated
            return true if warden.authenticated?
            params[:access_token] && @account = Account.find_by_authentication_token(params[:access_token])
          end

          def current_account
            @account
          end
        end

        # global exception handler, used for error notifications
        rescue_from ActiveRecord::RecordNotFound do |e|
          error_response(message: e.message, status: 404)
        end
      end
    end
  end
end
