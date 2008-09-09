class DropMealsOrdersTable < ActiveRecord::Migration
  def self.up
    drop_table :meals_orders
  end

  def self.down
    raise IrreversibleMigration
  end
end
