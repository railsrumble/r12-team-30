class ChangeTemplateToReference < ActiveRecord::Migration
  def up
    remove_column :themes, :layout
    remove_column :themes, :template

    add_column :themes, :template_id, :integer

    add_index :themes, :template_id
  end

  def down
  end
end
