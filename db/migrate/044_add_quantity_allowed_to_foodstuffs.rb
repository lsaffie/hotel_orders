class AddQuantityAllowedToFoodstuffs < ActiveRecord::Migration
  def self.up
    add_column :foodstuffs, :quantity_allowed, :integer
  end

  def self.down
    remove_column :foodstuffs, :quantity_allowed
  end
end
