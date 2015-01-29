module API
  module V1
    class AuthController < Grape::API
      include API::V1::Defaults

      resource :auth do
        desc 'Sign Up'
        params do
          requires :email, type: String
          requires :password, type: String
        end
        post do
          account = Account.new(permitted_params)

          if account.save
            account
          elsif account.invalid?
            error!({error: account.errors.messages}, 422)
          else
            error!('Unexpected Error', 500)
          end
        end

        desc 'Log In'
        params do
          requires :email, type: String
          requires :password, type: String
        end
        post :login do
          account = Account.find_by(email: params[:email].downcase)

          if account && account.valid_password?(params[:password])
            account
          else
            error!('401 Unauthorized', 401)
          end
        end
      end
    end
  end
end
