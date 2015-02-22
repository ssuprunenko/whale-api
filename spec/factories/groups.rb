# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#
FactoryGirl.define do
  factory :group do
    name    Faker::Commerce.department 1
    account
  end
end
