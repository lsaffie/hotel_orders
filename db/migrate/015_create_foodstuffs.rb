class CreateFoodstuffs < ActiveRecord::Migration
  def self.up
    create_table :foodstuffs do |t|
      t.column :name, :string
      t.column :menu_item_id, :integer
    end
  end

  def self.down
    drop_table :foodstuffs
  end
end
