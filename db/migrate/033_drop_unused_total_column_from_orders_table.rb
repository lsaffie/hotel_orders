class DropUnusedTotalColumnFromOrdersTable < ActiveRecord::Migration
  def self.up
    remove_column :orders, :total
  end

  def self.down
    add_column :orders, :total, :float
  end
end
