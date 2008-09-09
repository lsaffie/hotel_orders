class RemoveMenuIdFieldFromFoodstuffs < ActiveRecord::Migration
  def self.up
    remove_column :foodstuffs, :menu_id
  end

  def self.down
    add_column :foodstuffs, :menu_id, :integer
  end
end
