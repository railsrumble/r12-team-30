class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :store
      t.references :product_taxonomy
      t.string :name
      t.text :description
      t.float :price

      t.timestamps
    end
    add_index :products, :store_id
    add_index :products, :product_taxonomy_id
  end
end
