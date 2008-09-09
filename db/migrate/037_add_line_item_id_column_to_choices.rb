class AddLineItemIdColumnToChoices < ActiveRecord::Migration
  def self.up
    add_column :choices, :line_item_id, :integer
  end

  def self.down
    remove_column :choices, :line_item_id
  end
end
