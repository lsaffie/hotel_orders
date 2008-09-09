class CreateCarts < ActiveRecord::Migration
  def self.up
    create_table :carts do |t|
    end
  end

  def self.down
    drop_table :carts
  end
end
