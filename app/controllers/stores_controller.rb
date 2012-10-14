class StoresController < ApplicationController
  load_and_authorize_resource
  inherit_resources

  def create
    @store = Store.new(params[:store])
    @store.owner = current_user
    create!
  end

  def show
    @store = Store.find(params[:id])
    if @store.theme.present?
      theme @store.theme.template.template
    end
  end

  def manage_orders
    @store = Store.find(params[:id])
    @orders = @store.orders.manageable
  end

end
