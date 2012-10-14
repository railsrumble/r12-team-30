class CreateAllSlugs < ActiveRecord::Migration
  def up
    Store.find_each(&:save)
  end

  def down
  end
end
