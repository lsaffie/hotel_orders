# == Schema Information
# Schema version: 35
#
# Table name: menu_items
#
#  id          :integer         not null, primary key
#  name        :string(255)     
#  type        :string(255)     
#  menu_id     :integer         
#  price       :float           
#  description :text            
#

class MenuItem < ActiveRecord::Base
  
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :max_size => 500.kilobytes,
                 :resize_to => '320x200>'
                 #:thumbnails => { :thumb => '100x100>' }

  validates_as_attachment
  
  has_and_belongs_to_many :foodstuffs
  belongs_to :menu
  has_many :line_items
  #has_many :orders, :through => :line_items
  
  validates_presence_of :name, :price, :description
  
  def addable_foodstuffs
    Foodstuff.find(:all)
  end

end
