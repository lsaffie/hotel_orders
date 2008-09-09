class DropItemsMeals < ActiveRecord::Migration
  def self.up
		 drop_table :items_meals
  end

  def self.down
  end
end
