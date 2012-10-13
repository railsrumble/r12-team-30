class CreateSomeTaxonomies < ActiveRecord::Migration
  def up
    %w(Pizza Kebab Cakes Sushi Sandwiches Beverage).each do |name|
      ProductTaxonomy.create(name: name)
    end
  end

  def down
  end
end
