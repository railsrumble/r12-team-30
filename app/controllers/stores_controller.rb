class StoresController < ApplicationController
  load_and_authorize_resource
  inherit_resources

  def create
    @store = Store.new(params[:store])
    @store.owner = current_user
    create!
  end
end
