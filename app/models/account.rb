# == Schema Information
#
# Table name: accounts
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  authentication_token   :string
#  created_at             :datetime
#  updated_at             :datetime
#
class Account < ActiveRecord::Base
  has_many :groups, dependent: :destroy
  has_many :users, through: :groups

  before_save :ensure_authentication_token

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :validatable

  private

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless Account.where(authentication_token: token).first
    end
  end
end
