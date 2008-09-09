class AddMissingDescriptionFieldToMenuItems < ActiveRecord::Migration
  def self.up
    add_column :menu_items, :description, :text
  end

  def self.down
    remove_column :menu_items, :description
  end
end
