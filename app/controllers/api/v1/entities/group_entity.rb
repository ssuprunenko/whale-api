module API::V1::Entities
  class GroupEntity < Grape::Entity
    root 'groups', 'group'

    expose :id
    expose :name
  end
end
