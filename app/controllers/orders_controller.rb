class OrdersController < ApplicationController
  inherit_resources
  respond_to :html, :js

  before_filter :find_by_id, only: [:confirm, :complete]

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

  def update
    update! { manage_orders_store_path(@order.store) }
  end

  def confirm
    @order.confirm!
    flash[:notice] = "You have successfully confirmed an order!"
    redirect_to manage_orders_store_path(@order.store)
  end

  def complete
    @order.complete!
    flash[:notice] = "You have successfully completed an order!"
    redirect_to manage_orders_store_path(@order.store)
  end

  private

  def find_by_id
    @order = Order.find(params[:id])
  end
end
