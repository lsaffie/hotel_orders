class AdDatetimeToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :delivery_datetime, :datetime
  end

  def self.down
    remove_column :orders, :delivery_datetime
  end
end
