# == Schema Information
# Schema version: 35
#
# Table name: foodstuffs
#
#  id   :integer         not null, primary key
#  name :string(255)     
#

class Foodstuff < ActiveRecord::Base

  has_and_belongs_to_many :menu_items  
  has_many :options

  validates_presence_of :name
  
end
