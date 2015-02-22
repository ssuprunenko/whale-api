module API
  module V1
    class UsersController < Grape::API
      include API::V1::Defaults

      resource :users do
        before do
          authenticate!
        end

        desc 'Return all users'
        params do
          requires :access_token, type: String
        end
        get do
          users = current_account.users
          present users, with: API::V1::Entities::UserEntity
        end

        desc 'Create the user'
        params do
          requires :uid, type: Integer, desc: 'Instagram ID of the user'
          requires :access_token, type: String
          optional :name, type: String, desc: 'Full Name'
          optional :username, type: String, desc: 'Instagram username'
          optional :profile_picture, type: String, desc: 'Link to Profile Picture'
          optional :bio, type: String, desc: 'Bio'
          optional :website, type: String, desc: 'Website'
        end
        post do
          @user = User.new(permitted_params)
          if @user.save
            present @user, with: API::V1::Entities::UserEntity
          elsif @user.invalid?
            error!({error: @user.errors.messages}, 422)
          else
            error!('Unexpected Error', 500)
          end
        end

        before do
          @user = current_account.users.find_by(uid: params[:uid])
          raise(ActiveRecord::RecordNotFound) unless @user
        end

        desc 'Return the user'
        params do
          requires :uid, type: Integer, desc: 'Instagram ID of the user'
          requires :access_token, type: String
        end
        get ':uid' do
          present @user, with: API::V1::Entities::UserEntity
        end

        desc 'Update the user'
        params do
          requires :uid, type: Integer, desc: 'Instagram ID of the user'
          requires :access_token, type: String
          optional :name, type: String, desc: 'Full Name'
          optional :username, type: String, desc: 'Instagram username'
          optional :profile_picture, type: String, desc: 'Link to Profile Picture'
          optional :bio, type: String, desc: 'Bio'
          optional :website, type: String, desc: 'Website'
        end
        put ':uid' do
          if @user.update(permitted_params)
            present @user, with: API::V1::Entities::UserEntity
          else
            error!({error: @user.errors.full_messages.to_sentence}, 422)
          end
        end

        desc 'Delete the user'
        params do
          requires :uid, type: Integer, desc: 'Instagram ID of the user'
          requires :access_token, type: String
        end
        delete ':uid' do
          @user.destroy
        end
      end
    end
  end
end
