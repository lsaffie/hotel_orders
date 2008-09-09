class AddAdditionalFieldsForOrders < ActiveRecord::Migration
    def self.up
      add_column :orders, :updated_on, :timestamp
      change_column :orders, :order_status, :string, :default => 'Incomplete'
    end

    def self.down
      remove_column :orders, :updated_on
      change_column :orders, :order_status
    end
  end