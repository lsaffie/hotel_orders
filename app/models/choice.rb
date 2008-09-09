# == Schema Information
# Schema version: 35
#
# Table name: choices
#
#  id        :integer         not null, primary key
#  option_id :integer         
#

class Choice < ActiveRecord::Base

  #belongs_to :option
  belongs_to :line_item
  
    def self.from_cart(option, fs_quantity)
      c= self.new
      c.name = option.name
      # op = Option.find(:all, :conditions => ['name = ?', option.name])
      # c.foodstuff_name = op[0].foodstuff.name
      # c.foodstuff_quantity = fs_quantity
      fs = Foodstuff.find(option.foodstuff_id)
      c.foodstuff_name = fs.name
      c.foodstuff_quantity = fs_quantity
      c
    end
      
end
