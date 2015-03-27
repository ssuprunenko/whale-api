# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  uid             :integer
#  username        :string
#  name            :string
#  profile_picture :string
#  bio             :text
#  website         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryGirl.define do
  factory :user do
    uid      Faker::Number.number 8
    username Faker::Internet.user_name
    name     Faker::Name.name
    bio      Faker::Lorem.sentence
    website  Faker::Internet.url
  end
end
