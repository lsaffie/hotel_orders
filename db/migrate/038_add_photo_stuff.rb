class AddPhotoStuff < ActiveRecord::Migration
  def self.up
    add_column :menu_items, :parent_id,  :integer
    add_column :menu_items, :content_type, :string
    add_column :menu_items, :filename, :string    
    add_column :menu_items, :thumbnail, :string 
    add_column :menu_items, :size, :integer
    add_column :menu_items, :width, :integer
    add_column :menu_items, :height, :integer
  end

  def self.down
    remove_column :menu_items, :parent_id
    remove_column :menu_items, :content_type
    remove_column :menu_items, :filename   
    remove_column :menu_items, :thumbnail 
    remove_column :menu_items, :size
    remove_column :menu_items, :width
    remove_column :menu_items, :height
  end
end
