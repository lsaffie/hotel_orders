class AddColumnsToChoices < ActiveRecord::Migration
  def self.up
    remove_column :choices, :option_id
    add_column :choices, :name, :string
    add_column :choices, :foodstuff_id, :integer
  end

  def self.down
    remove_column :choices, :name
    remove_column :choices, :foodstuff_id
  end
end
