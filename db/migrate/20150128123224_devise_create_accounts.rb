class DeviseCreateAccounts < ActiveRecord::Migration
  def change
    create_table(:accounts) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.string :authentication_token

      t.timestamps
    end

    add_index :accounts, :email,                unique: true
    add_index :accounts, :reset_password_token, unique: true
    add_index :accounts, :authentication_token, unique: true
  end
end
