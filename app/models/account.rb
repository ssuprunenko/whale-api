class Account < ActiveRecord::Base
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :validatable

  before_save :ensure_authentication_token

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless Account.where(authentication_token: token).first
    end
  end
end
