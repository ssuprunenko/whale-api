module API
  module V1
    class MediaController < Grape::API
      include API::V1::Defaults

      resource :media do
        desc 'Return all media'
        get '', root: :media do
          media = Media.all
          present media, with: Media::V1::Entity
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
