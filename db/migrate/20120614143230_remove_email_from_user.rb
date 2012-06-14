class RemoveEmailFromUser < ActiveRecord::Migration
  def up
  remove_column :users, :email
  remove_column :users, :users, :encrypted_password
  remove_column :users, :reset_password_token
  remove_column :users, :reset_password_sent_at
  remove_column :users, :remember_created_at
  end

  def down
  end
end
