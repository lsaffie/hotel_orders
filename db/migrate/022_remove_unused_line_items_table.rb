class RemoveUnusedLineItemsTable < ActiveRecord::Migration
  def self.up
    drop_table :line_items
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
