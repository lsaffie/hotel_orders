class AddChoicesTable < ActiveRecord::Migration
  def self.up
    create_table :choices do |t|
      t.column :option_id, :integer
    end
  end

  def self.down
    drop_table :choices
  end
end
