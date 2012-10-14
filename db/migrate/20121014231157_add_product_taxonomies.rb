class AddProductTaxonomies < ActiveRecord::Migration
  def up
    map = {
      "Wine" => "grape.png",
      "Bread" => "bread-2.png", 
      "Vegetables" => "cauliflower.png",
      "Fruit" => "cherries.png",
      "Coffee" => "coffee_cup.png",
      "Popcorn" => "popcorn.png",
      "CousCous" => 'Plate-3.png'
    }

    map.each do |k, v|
      ProductTaxonomy.create(name: k, icon: v)
    end
  end

  def down
  end
end
