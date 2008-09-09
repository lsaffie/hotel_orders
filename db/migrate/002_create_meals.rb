class CreateMeals < ActiveRecord::Migration
  def self.up
    create_table :meals do |t|
			t.column :type, :string
			t.column :name, :string
    end
  end

  def self.down
    drop_table :meals
  end
end
