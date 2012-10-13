class ProductTaxonomy < ActiveRecord::Base
  attr_accessible :description, :icon, :name

  validates_presence_of :name
end
