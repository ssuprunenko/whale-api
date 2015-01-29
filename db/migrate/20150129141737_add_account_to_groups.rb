class AddAccountToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :account_id, :integer
    add_index :groups, :account_id
  end
end
