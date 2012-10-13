class ProductTaxonomy < ActiveRecord::Base
  attr_accessible :description, :icon, :name

  validates_presence_of :name

  def icon_dir
    "/product_taxonomies/"
  end

  def icon_url
    icon_dir + icon
  end
end
