class AddPictureToStorePictures < ActiveRecord::Migration
  def change
    add_column :store_pictures, :picture, :string
  end
end
