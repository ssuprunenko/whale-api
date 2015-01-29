# == Schema Information
#
# Table name: groups_users
#
#  id       :integer          not null, primary key
#  group_id :integer
#  user_id  :integer
#
class GroupsUsers < ActiveRecord::Base
end
