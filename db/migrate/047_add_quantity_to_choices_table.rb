class AddQuantityToChoicesTable < ActiveRecord::Migration
  def self.up
     add_column :choices, :quantity, :integer
  end

  def self.down
     remove_column :choices, :quantity
  end
end
