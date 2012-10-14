class ChangeTemplateDublinFromPlainToEvergreen < ActiveRecord::Migration
  def up
    templates = {
      "Dublin" => "evergreen",
    }

    templates.each do |k, v|
      t = Template.find_by_name(k)
      t.update_attributes(:template => v)
    end
  end

  def down
  end
end
