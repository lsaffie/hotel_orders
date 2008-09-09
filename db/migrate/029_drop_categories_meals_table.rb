class DropCategoriesMealsTable < ActiveRecord::Migration
  def self.up
    drop_table :categories_meals
  end

  def self.down
    raise IrreversibleMigration
  end
end
