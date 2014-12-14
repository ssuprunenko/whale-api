class MediaSerializer < ActiveModel::Serializer
  attributes :media_type, :caption, :link, :created_time, :id
end
