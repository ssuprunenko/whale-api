require 'grape-swagger'

module API
  module V1
    class Base < Grape::API
      mount API::V1::AuthController
      mount API::V1::MediaController
      mount API::V1::UsersController
      mount API::V1::GroupsController

      add_swagger_documentation(
        mount_path: '/v1/swagger_doc',
        api_version: 'v1',
        hide_documentation_path: true,
        hide_format: false
      )
    end
  end
end
