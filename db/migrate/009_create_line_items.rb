class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
			t.column :meal_name, :string
			t.column :quantity, :integer
			t.column :price, :float
			t.column :order_id, :integer
			t.column :meal_id, :integer
    end
  end

  def self.down
    drop_table :line_items
  end
end
