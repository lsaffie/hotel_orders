# == Schema Information
# Schema version: 35
#
# Table name: line_items
#
#  id           :integer         not null, primary key
#  order_id     :integer         
#  menu_item_id :integer         
#

class LineItem < ActiveRecord::Base

  belongs_to :menu_item  
  belongs_to :order
  has_many :choices
  
  def self.from_cart_item(cart_item)
    li= self.new
    
    i = 0
    while i < cart_item.options.length
      if cart_item.foodstuff_quantity
        li.choices[i] = Choice.from_cart(cart_item.options[i],cart_item.foodstuff_quantity[i])
      else
        li.choices[i] = Choice.from_cart(cart_item.options[i],1)
      end
      li.choices[i].quantity = cart_item.quantities[i]
      i += 1
    end
     
    li.name = cart_item.menu_item.name
    li.price = cart_item.menu_item.price
    li
  end
  
end
