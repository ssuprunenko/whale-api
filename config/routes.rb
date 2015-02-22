Rails.application.routes.draw do
  devise_for :accounts

  constraints subdomain: 'dev' do
    mount GrapeSwaggerRails::Engine, at: '/'
  end

  constraints subdomain: 'api' do
    mount API::Base, at: '/'
  end
end
