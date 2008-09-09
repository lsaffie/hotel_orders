class AddMissingPriceFieldToMenuItem < ActiveRecord::Migration
  def self.up
    add_column :menu_items, :price, :float
  end

  def self.down
    remove_column :menu_items, :price
  end
end
