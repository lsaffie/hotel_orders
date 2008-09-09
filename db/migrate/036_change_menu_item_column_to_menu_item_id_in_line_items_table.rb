class ChangeMenuItemColumnToMenuItemIdInLineItemsTable < ActiveRecord::Migration
  def self.up
    remove_column :line_items, :menu_item
    add_column :line_items, :menu_item_id, :integer
  end

  def self.down
    remove_column :line_items, :menu_item_id
    add_column :line_items, :menu_item, :integer
  end
end
