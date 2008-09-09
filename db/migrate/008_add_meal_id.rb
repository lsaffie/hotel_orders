class AddMealId < ActiveRecord::Migration
  def self.up
		add_column :items, :meal_id, :integer
  end

  def self.down
		remove_column :items, :meal_id
  end
end
