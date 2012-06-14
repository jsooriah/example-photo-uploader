class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image
      t.string :location
      t.string :lat
      t.string :lon
      t.integer :user_id

      t.timestamps
    end
  end
end
