class AddHelperTextToFoodstuffs < ActiveRecord::Migration
  def self.up
    add_column :foodstuffs, :helper_text, :string
  end

  def self.down
    remove_column :foodstuffs, :helper_text
  end
end
