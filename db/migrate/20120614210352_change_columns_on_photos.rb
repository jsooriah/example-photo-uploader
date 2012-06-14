class ChangeColumnsOnPhotos < ActiveRecord::Migration
  def up
  change_column :photos, :lat , :float
  change_column :photos, :lon , :float
  end

  def down
  end
end
