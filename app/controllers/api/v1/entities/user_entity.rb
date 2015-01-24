module API::V1::Entities
  class UserEntity < Grape::Entity
    expose :uid
    expose :username
    expose :name
    expose :profile_picture
    expose :bio
  end
end
