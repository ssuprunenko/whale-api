require 'grape-swagger'

module API
  module V1
    class Base < Grape::API
      mount API::V1::MediaController
      mount API::V1::UsersController

      add_swagger_documentation(
        hide_format: true
      )
    end
  end
end
