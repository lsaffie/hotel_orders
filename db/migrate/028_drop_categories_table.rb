class DropCategoriesTable < ActiveRecord::Migration
  def self.up
    drop_table :categories
  end

  def self.down
    raise IrreversibleMigration
  end
end
