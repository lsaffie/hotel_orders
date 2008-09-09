class CreateItemsMeals < ActiveRecord::Migration
  def self.up
    create_table :items_meals do |t|
			t.column :item_id, :integer
			t.column :meal_id, :integer
    end
  end

  def self.down
    drop_table :items_meals
  end
end
