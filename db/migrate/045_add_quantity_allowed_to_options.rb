class AddQuantityAllowedToOptions < ActiveRecord::Migration
  def self.up
    add_column :options, :quantity_allowed, :integer
  end

  def self.down
    remove_column :options, :quantity_allowed
  end
end
