class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.string :description
      t.string :short_description
      t.string :contact_info
      t.string :currency

      t.timestamps
    end
  end
end
