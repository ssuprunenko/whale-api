class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :media_type
      t.text :caption
      t.string :link
      t.string :created_time

      t.timestamps
    end
  end
end
