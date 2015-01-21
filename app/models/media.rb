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

    client = Instagram.client(access_token: ENV['INSTAGRAM_ACCESS_TOKEN'])
    items = client.media_search(lat, lng, distance: @distance)
    items.first(@limit)
  end
end
