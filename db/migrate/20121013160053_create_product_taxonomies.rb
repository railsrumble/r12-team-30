class CreateProductTaxonomies < ActiveRecord::Migration
  def change
    create_table :product_taxonomies do |t|
      t.string :name
      t.text :description
      t.string :icon

      t.timestamps
    end
  end
end
