class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :real_name, :string
    add_column :users, :sent_orders, :integer
    add_column :users, :completed_orders, :integer
  end
end
