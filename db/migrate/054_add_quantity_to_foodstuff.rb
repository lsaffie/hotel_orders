class AddQuantityToFoodstuff < ActiveRecord::Migration
  def self.up
    add_column :foodstuffs, :quantity, :integer
  end

  def self.down
    remove_column :foodstuffs, :quantity
  end
end
