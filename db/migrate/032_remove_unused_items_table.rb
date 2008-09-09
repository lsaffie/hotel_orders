class RemoveUnusedItemsTable < ActiveRecord::Migration
  def self.up
    drop_table :items
  end

  def self.down
    raise IrreversibleMigration
  end
end
