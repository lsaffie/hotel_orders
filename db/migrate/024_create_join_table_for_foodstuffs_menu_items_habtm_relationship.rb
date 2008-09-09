class CreateJoinTableForFoodstuffsMenuItemsHabtmRelationship < ActiveRecord::Migration
  def self.up
    create_table(:foodstuffs_menu_items, :id => false) do |t|
      t.column :foodstuff_id, :integer
      t.column :menu_item_id, :integer
    end
  end

  def self.down
    drop_table(:foodstuffs_menu_items)
  end
end
