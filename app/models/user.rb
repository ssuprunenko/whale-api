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
class User < ActiveRecord::Base
  has_and_belongs_to_many :groups

  validates :uid, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
