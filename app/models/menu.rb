# == Schema Information
# Schema version: 35
#
# Table name: menus
#
#  id   :integer         not null, primary key
#  name :string(255)     
#

class Menu < ActiveRecord::Base
  
  has_many :menu_items
  
  validates_presence_of :name
  
end
