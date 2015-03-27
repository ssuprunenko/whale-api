require 'rails_helper'

describe API::V1::AuthController, type: :request do
  describe 'POST #auth' do
    let(:account) { build(:account) }

    before(:each) do
      post api_path('/v1/auth'), { email: account.email, password: account.password }
    end

    it 'returns 201 Created' do
      expect_status '201'
    end

    it 'returns Access Token' do
      expect_json_types authentication_token: :string
    end

    it 'returns created Account' do
      expect_json email: account.email
    end

    it 'returns 400 Bad Request if email or password not set' do
      post api_path('/v1/auth'), { password: account.password }
      expect_status '400'

      post api_path('/v1/auth'), { email: account.email }
      expect_status '400'
    end

    it 'returns 422 Unprocessable Entity if password invalid' do
      post api_path('/v1/auth'), { email: account.email, password: '123' }

      expect_status '422'
    end

    it 'returns 422 Unprocessable Entity if Account already exist' do
      post api_path('/v1/auth'), { email: account.email, password: account.password }

      expect_status '422'
    end
  end

  describe 'GET #login' do
    let(:account) { create(:account) }

    before(:each) do
      get api_path('/v1/auth/login'), { email: account.email, password: account.password }
    end

    it 'returns 200 OK' do
      expect_status '200'
    end

    it 'returns Access Token' do
      expect_json_types authentication_token: :string
    end

    it 'returns Account' do
      expect_json email: account.email
    end

    it 'returns 400 Bad Request if email or password not set' do
      get api_path('/v1/auth/login'), { password: account.password }
      expect_status '400'

      get api_path('/v1/auth/login'), { email: account.email }
      expect_status '400'
    end

    it 'returns 401 Unauthorized if password invalid' do
      get api_path('/v1/auth/login'), { email: account.email, password: '123' }

      expect_status '401'
    end
  end
end
