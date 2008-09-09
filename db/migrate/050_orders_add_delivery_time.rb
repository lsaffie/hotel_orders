class OrdersAddDeliveryTime < ActiveRecord::Migration
  def self.up
    #add_column :orders, :delivery_time, :string
  end

  def self.down
    #remove_column :orders, :delivery_time
  end
end
