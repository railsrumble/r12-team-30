class RemoveLayoutFromTemplates < ActiveRecord::Migration
  def up
    remove_column :templates, :layout

    templates = {
      "Paris" => "elegant",
      "Dublin" => "plain",
      "Cleveland" => "fastfood"
    }

    templates.each do |name, template|
      Template.create(name: name, template: template)
    end
  end

  def down
  end
end
