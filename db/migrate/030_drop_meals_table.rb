class DropMealsTable < ActiveRecord::Migration
  def self.up
    drop_table :meals
  end

  def self.down
    raise IrreversibleMigration
  end
end
