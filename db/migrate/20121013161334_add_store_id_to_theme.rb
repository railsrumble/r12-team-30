class AddStoreIdToTheme < ActiveRecord::Migration
  def change
    add_column :themes, :store_id, :integer

    add_index :themes, :store_id
  end
end
