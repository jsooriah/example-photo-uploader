class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :provider
      t.string :uuid
      t.integer :user_id
      

      t.timestamps
    end
  end
end
