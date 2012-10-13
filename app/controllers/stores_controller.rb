class StoresController < ApplicationController
  inherit_resources

  def create
    @store = Store.new(params[:store])
    @store.owner = current_user
    create!
  end
end
