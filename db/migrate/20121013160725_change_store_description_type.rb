class ChangeStoreDescriptionType < ActiveRecord::Migration
  def up
    change_column :stores, :description, :text
  end

  def down
  end
end
