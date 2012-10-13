class RenamePictureString < ActiveRecord::Migration
  def up
    rename_column :store_pictures, :picture, :image
  end

  def down
  end
end
