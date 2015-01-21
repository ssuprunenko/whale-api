module API
  module V1
    class MediaController < Grape::API
      include API::V1::Defaults

      resource :media do
        desc 'Search for media in a given area'
        params do
          # TODO: Replace optional to requires for coords
          optional :lat, type: Float, desc: 'Latitude', default: 59.842373
          optional :lng, type: Float, desc: 'Longitude', default: 30.210820
          optional :limit, type: Integer, desc: 'Limit', default: 10
          optional :distance, type: Integer, desc: 'Distance', default: 1000
        end
        get '', root: :media do
          lat, lng = params[:lat], params[:lng]
          media = Media.media_search(lat, lng, permitted_params.except(:lat, :lng))

          present media, with: API::V1::Entities::MediaEntity
        end

        desc 'Return a media'
        params do
          requires :id, type: String, desc: 'ID of the media'
        end
        get ':id', root: 'media' do
          Media.find(permitted_params[:id])
        end
      end
    end
  end
end
