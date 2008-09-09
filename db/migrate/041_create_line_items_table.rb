class CreateLineItemsTable < ActiveRecord::Migration
  def self.up
    remove_column :line_items, :meal_name
    remove_column :line_items,:quantity
    remove_column :line_items,:price
    remove_column :line_items,:order_id
    remove_column :line_items,:meal_id
    add_column :line_items, :options, :string
    add_column :line_items, :quantity, :integer
    add_column :line_items, :price, :float
    add_column :line_items, :name, :string		
    add_column :line_items, :order_id, :integer
  end

  def self.down
    remove_column :line_items, :options
    remove_column :line_items, :quantity
    remove_column :line_items, :price
    remove_column :line_items, :menu_item_id
    remove_column :line_items, :order_id
    remove_column :line_items, :name
  end
end
