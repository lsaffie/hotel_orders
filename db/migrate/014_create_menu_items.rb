class CreateMenuItems < ActiveRecord::Migration
  def self.up
    create_table :menu_items do |t|
      t.column :name, :string
      t.column :type, :string
    end
  end

  def self.down
    drop_table :menu_items
  end
end
