class RemoveMenuItemIdFieldFromFoodstuffs < ActiveRecord::Migration
  def self.up
    remove_column :foodstuffs, :menu_item_id 
  end

  def self.down
    add_column :foodstuffs, :menu_item_id, :integer
  end
end
