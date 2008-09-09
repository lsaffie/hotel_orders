class CreateCategoriesMeals < ActiveRecord::Migration
  def self.up
		create_table :categories_meals do |t|
			t.column :meal_id, :integer
			t.column :category_id, :integer
		end
		add_index :categories_meals, [:meal_id]
    add_index :categories_meals, [:category_id]
  end

  def self.down
		remove_table :categories_meals
  end
end
