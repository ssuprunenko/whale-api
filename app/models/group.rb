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
class Group < ActiveRecord::Base
  belongs_to :account
  has_and_belongs_to_many :users

  validates :name, presence: true
end
