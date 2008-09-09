class OrderDateToDateFormat < ActiveRecord::Migration
  def self.up
    change_column :orders, :arrival_date, :date
  end

  def self.down
    change_column :orders, :arrival_date, :string
  end
end
