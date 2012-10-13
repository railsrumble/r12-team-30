class CreateStorePictures < ActiveRecord::Migration
  def change
    create_table :store_pictures do |t|
      t.references :store

      t.timestamps
    end
    add_index :store_pictures, :store_id
  end
end
