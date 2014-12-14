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
class Media < ActiveRecord::Base
  extend Enumerize

  enumerize :media_type,
            in: [:image, :video],
            default: :image,
            predicates: true
end
