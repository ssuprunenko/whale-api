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
FactoryGirl.define do
  factory :account do
    email    Faker::Internet.email
    password Faker::Internet.password 6
  end
end
