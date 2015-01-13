# == Schema Information
#
# Table name: media
#
#  id           :integer          not null, primary key
#  media_type   :string(255)
#  caption      :text
#  link         :string(255)
#  created_time :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#
class Media < ActiveRecord::Base
  def self.media_search(lat, lng, opts={limit: 10, distance: 1000})
    opts.each { |k,v| instance_variable_set("@#{k}", v) }

    client = Instagram.client
    items = client.media_search(lat, lng, count: @limit, distance: @distance)
  end


  module V1
    class Entity < Grape::Entity
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
end
