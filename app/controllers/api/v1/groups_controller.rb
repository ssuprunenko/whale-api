module API
  module V1
    class GroupsController < Grape::API
      include API::V1::Defaults

      resource :groups do
        desc 'Return all groups'
        get do
          groups = Group.all
        end

        desc 'Create a group'
        params do
          requires :name, type: String, desc: 'Name of Group'
        end
        post do
          @group = Group.new(permitted_params)
          if @group.save
            @group
          elsif @group.invalid?
            error!({error: @group.errors.messages}, 422)
          else
            error!('Unexpected Error', 500)
          end
        end

        before do
          @group = Group.find(params[:id])
          raise(ActiveRecord::RecordNotFound) unless @group
        end

        desc 'Return a group'
        params do
          requires :id, type: Integer
        end
        get ':id' do
          @group
        end

        desc 'Update a group'
        params do
          requires :id, type: Integer
          optional :name, type: String, desc: 'Name of Group'
        end
        put ':id' do
          if @group.update(permitted_params)
            @group
          else
            error!({error: @group.errors.full_messages.to_sentence}, 422)
          end
        end

        desc 'Delete a group'
        params do
          requires :id, type: Integer
        end
        delete ':id' do
          @group.destroy
        end
      end
    end
  end
end
