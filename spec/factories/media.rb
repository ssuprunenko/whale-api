# == Schema Information
#
# Table name: media
#
#  id           :integer          not null, primary key
#  media_type   :string(255)
#  caption      :text
#  link         :string(255)
#  created_time :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#
FactoryGirl.define do
  factory :media do
    media_type %w(video image).sample
    caption    Faker::Lorem.paragraph 1
    link       Faker::Internet.url('instagram.com/p')
  end
end
