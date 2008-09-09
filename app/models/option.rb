# == Schema Information
# Schema version: 35
#
# Table name: options
#
#  id           :integer         not null, primary key
#  name         :string(255)     
#  foodstuff_id :string(255)     
#

class Option < ActiveRecord::Base
  
  validates_presence_of :name
  
  belongs_to :foodstuff
  has_many :choices
  
end
