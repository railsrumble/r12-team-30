class CreateOpeningTimes < ActiveRecord::Migration
  def change
    create_table :opening_times do |t|
      t.references :store
      t.integer :weekday
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
    add_index :opening_times, :store_id
  end
end
