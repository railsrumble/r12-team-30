class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :layout
      t.string :template
      t.string :palette
      t.string :font

      t.timestamps
    end
  end
end
