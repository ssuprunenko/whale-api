module API
  module V1
    class GroupsController < Grape::API
      include API::V1::Defaults

      resource :groups do
        before do
          authenticate!
        end

        desc 'Return all groups'
        params do
          requires :access_token, type: String
        end
        get do
          groups = current_account.groups
          present groups, with: API::V1::Entities::GroupEntity
        end

        desc 'Create a group'
        params do
          requires :name, type: String, desc: 'Name of Group'
        end
        post do
          @group = current_account.groups.new(permitted_params)
          if @group.save
            present @group, with: API::V1::Entities::GroupEntity
          elsif @group.invalid?
            error!({error: @group.errors.messages}, 422)
          else
            error!('Unexpected Error', 500)
          end
        end

        before do
          @group = current_account.groups.find(params[:id])
          raise(ActiveRecord::RecordNotFound) unless @group
        end

        desc 'Return a group'
        params do
          requires :id, type: Integer
          requires :access_token, type: String
        end
        get ':id' do
          present @group, with: API::V1::Entities::GroupEntity
        end

        desc 'Update a group'
        params do
          requires :id, type: Integer
          requires :access_token, type: String
          optional :name, type: String, desc: 'Name of Group'
        end
        put ':id' do
          if @group.update(permitted_params)
            present @group, with: API::V1::Entities::GroupEntity
          else
            error!({error: @group.errors.full_messages.to_sentence}, 422)
          end
        end

        desc 'Delete a group'
        params do
          requires :id, type: Integer
          requires :access_token, type: String
        end
        delete ':id' do
          @group.destroy
        end
      end
    end
  end
end
