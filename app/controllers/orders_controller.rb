class OrdersController < ApplicationController
  inherit_resources
  respond_to :html, :js

  def create
    products_ids = params[:order_products][:ids].split(",").map(&:to_i)
    products_quantities = params[:order_products][:quantities].split(",").map(&:to_i)
    products = products_ids.zip(products_quantities)

    @order = Order.new(params[:order])
    @order.customer = current_user
    if @order.save
      products.each do |id, quantity|
        item = OrderItem.new(order: @order, product: Product.find(id), quantity: quantity)
        @order.items << item
      end
    end
  end
end
