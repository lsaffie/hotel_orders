class CreateCustomizedMenus < ActiveRecord::Migration
  def self.up
    create_table :customized_menus do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :customized_menus
  end
end
