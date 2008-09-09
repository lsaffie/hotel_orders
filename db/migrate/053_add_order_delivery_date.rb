class AddOrderDeliveryDate < ActiveRecord::Migration
  def self.up
    add_column :orders, :delivery_date, :date
  end

  def self.down
    remove_column :orders, :delivery_date
  end
end
