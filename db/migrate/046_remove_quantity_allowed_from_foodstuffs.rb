class RemoveQuantityAllowedFromFoodstuffs < ActiveRecord::Migration
  def self.up
    remove_column :foodstuffs, :quantity_allowed
  end

  def self.down
  end
end
