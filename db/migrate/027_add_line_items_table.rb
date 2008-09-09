class AddLineItemsTable < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.column :menu_item, :integer
    end
  end

  def self.down
    drop_table :line_items
  end
end
