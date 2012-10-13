class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :layout
      t.string :template
      t.string :name

      t.timestamps
    end
  end
end
