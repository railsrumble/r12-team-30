class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :store
      t.datetime :pickup_time
      t.string :status
      t.string :customer_note
      t.string :store_note

      t.timestamps
    end
    add_index :orders, :store_id
  end
end
