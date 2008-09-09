class CreateMealsOrders < ActiveRecord::Migration
  def self.up
    create_table :meals_orders do |t|
			t.column :order_id, :integer
			t.column :meal_id, :integer
    end
  end

  def self.down
    drop_table :meals_orders
  end
end
