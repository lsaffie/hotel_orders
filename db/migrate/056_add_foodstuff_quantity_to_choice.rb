class AddFoodstuffQuantityToChoice < ActiveRecord::Migration
  def self.up
    add_column :choices, :foodstuff_quantity, :integer
  end

  def self.down
    remove_column :choices, :foodstuff_quantity
  end
end
