class AddIconsToProductTaxonomies < ActiveRecord::Migration
  def up

    map = {
      "Pizza" => "pizza.png",
      "Kebab" => "ham.png", 
      "Cakes" => "cake-1.png",
      "Sushi" => "saltcellar.png",
      "Sandwiches" => "hotdog.png",
      "Beverage" => "Bottle_with_glass.png"
    }

    map.each do |k, v|
      taxonomy = ProductTaxonomy.find_by_name(k)
      taxonomy.update_attributes(:icon => v)
    end
  end

  def down
  end
end
