module API
  module V1
    class UsersController < Grape::API
      include API::V1::Defaults

      resource :users do
        desc 'Return all users'
        get '', root: :users do
          users = User.all

          present users, with: API::V1::Entities::UserEntity
        end

        desc 'Return the user'
        params do
          requires :uid, type: String, desc: 'Instagram ID of the user'
        end
        get ':uid', root: 'user' do
          user = User.find_by(uid: permitted_params[:uid])

          present user, with: API::V1::Entities::UserEntity
        end
      end
    end
  end
end
