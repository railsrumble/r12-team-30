class Product < ActiveRecord::Base
  belongs_to :store
  belongs_to :product_taxonomy
  attr_accessible :description, :name, :price, :product_taxonomy_id

  validates_presence_of :name, :price

  scope :filter_by_taxonomy, lambda { |taxonomy|
    where(:product_taxonomy_id => taxonomy.id) if taxonomy
  }
end
