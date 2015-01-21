module API::V1::Entities
  class MediaEntity < Grape::Entity
    expose :tags

    expose :location do
      expose :latitude do |media|
        media.location.latitude
      end
      expose :longitude do |media|
        media.location.longitude
      end
    end

    expose :created_time

    expose :link

    expose :image do |media|
      media.images.low_resolution.url
    end

    expose :caption do |media|
      media.caption.try(:text)
    end

    expose :type do |media|
      media.type
    end

    expose :id

    expose :user do
      expose :username do |media|
        media.user.username
      end
      expose :full_name do |media|
        media.user.full_name
      end
      expose :id do |media|
        media.user.id
      end
    end
  end
end
