module API::V1::Entities
  class UserEntity < Grape::Entity
    root 'users', 'user'

    expose :uid
    expose :username
    expose :name
    expose :profile_picture
    expose :bio
  end
end
