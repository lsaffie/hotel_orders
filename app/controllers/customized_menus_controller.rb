class CustomizedMenusController < ApplicationController

  # TODO spec me
  def show
    @menu_item = MenuItem.find(params[:id])
    @foodstuffs = @menu_item.foodstuffs
    @quantity = [0,1,2,3,4,5,6]
    @quantity4 = [0,1,2,3,4]
    @quantity24 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
    @cart = find_cart
  end
  
  # TODO spec me
  def create
    @options = params[:options]
    @cart = find_cart
    @menu = Menu.find(params[:id])
    @menu_items = @menu.menu_items.find(params[:menu_view_id])
    @cart.add_items(@menu, @menu_items,@options)
  end
  

end
