class CreateLineitems < ActiveRecord::Migration
  def self.up
    create_table :lineitems do |t|
    end
  end

  def self.down
    drop_table :lineitems
  end
end
