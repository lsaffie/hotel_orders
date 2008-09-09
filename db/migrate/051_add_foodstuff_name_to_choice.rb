class AddFoodstuffNameToChoice < ActiveRecord::Migration
  def self.up
    add_column :choices, :foodstuff_name, :string
  end

  def self.down
    remove_column :choices, :foodstuff_name
  end
end
