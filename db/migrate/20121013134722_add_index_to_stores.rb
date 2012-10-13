class AddIndexToStores < ActiveRecord::Migration
  def change
    add_index :stores, :owner_id
  end
end
