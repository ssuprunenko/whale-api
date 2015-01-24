module API
  class Base < Grape::API
    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    mount API::V1::Base
  end
end
