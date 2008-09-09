class RemoveUnusedTableLineitems < ActiveRecord::Migration
  def self.up
    drop_table :lineitems
  end

  def self.down
    ActiveRecord::IrreversibleMigration
  end
end
