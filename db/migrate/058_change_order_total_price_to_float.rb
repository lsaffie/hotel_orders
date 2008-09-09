class ChangeOrderTotalPriceToFloat < ActiveRecord::Migration
  def self.up
    change_column :orders, :total_price, :float, :default => 0.0
  end

  def self.down
  end
end
