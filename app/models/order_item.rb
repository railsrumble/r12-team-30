class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  attr_accessible :order, :product, :quantity

  delegate :name, :price, to: :product

  def subtotal
    quantity * price
  end
end
