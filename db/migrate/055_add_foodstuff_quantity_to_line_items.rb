class AddFoodstuffQuantityToLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :foodstuff_quantity, :integer
  end

  def self.down
    remove_column :line_items, :foodstuff_quantity
  end
end
