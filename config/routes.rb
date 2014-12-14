Rails.application.routes.draw do
  constraints subdomain: 'api' do
    mount API::Base, at: '/'
    mount GrapeSwaggerRails::Engine, at: '/documentation'
  end
end
