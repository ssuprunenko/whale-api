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
  def self.media_search(lat, lng, opts={limit: 10, distance: 1000})
    opts.each { |k,v| instance_variable_set("@#{k}", v) }

    client = Instagram.client
    items = client.media_search(lat, lng, count: @limit, distance: @distance)
  end
end
