class AddMissingMenuIdFieldToMenuItems < ActiveRecord::Migration
  def self.up
    add_column :menu_items, :menu_id, :integer
  end

  def self.down
    remove_column :menu_items, :menu_id
  end
end
